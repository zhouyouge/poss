package com.kgc.util;
import com.kgc.LogUtil.IpUtils;
import com.kgc.LogUtil.JSON;
import com.kgc.LogUtil.LogAnnotation;
import com.kgc.entity.UserInfo;
import com.kgc.service.LogService;
import com.kgc.entity.SysLog;
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.UUID;

/**
 * AOP
 * 增强处理工具类
 */
@Aspect
@Component
public class ServiceLogger {
    @Autowired
    private LogService sysLogService;
 /*日志打印*/
    private static Logger logger=Logger.getLogger(ServiceLogger.class);
 /**
     * 环绕增强
     * @param joinPoint
     * @return
     */
    @Around("execution(* com.kgc.service..*.*(..))")
    private Object round(ProceedingJoinPoint joinPoint){
        logger.info("r:前置增强调用:" + joinPoint.getTarget() + "的"
                + joinPoint.getSignature().getName() + "方法，方法入参:"
                + Arrays.toString(joinPoint.getArgs()));

        //获取切入点所在的方法
        String targetName = joinPoint.getTarget().getClass().getName();
        Class targetClass = null;
        try {
            targetClass = Class.forName(targetName);
            String methodName = joinPoint.getSignature().getName();

            SysLog sysLog=new SysLog();
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
          HttpSession session= request.getSession();
          UserInfo userInfo= (UserInfo) session.getAttribute("user");

            Method[] method = targetClass.getMethods();
            Object[] args = joinPoint.getArgs(); // 获得参数列表

            for (Method m : method) {
                if (m.getName().equals(methodName)) {
                    Class[] tmpCs = m.getParameterTypes();
                    if (tmpCs.length == args.length) {
                        // 获取注解内容
                        LogAnnotation logs = m.getAnnotation(LogAnnotation.class);
                        if (logs != null) {
                            //写入参数
                            if (args.length > 0) {
                                // 使用json转换工具 将参数转为json串，以便存入数据库
                                String jsonStr = JSON.toJSONString(args);
                                sysLog.setParams(jsonStr);
                            }
                            //获取模块名称
                            String moduleName = logs.moduleName();
                            //获取操作名称
                            String operate = logs.operate();
                            sysLog.setModuleName(moduleName);
                            sysLog.setOperate(operate);
                            sysLog.setClassName(targetName);
                            sysLog.setMethodName(methodName);
                            sysLog.setLogId(IdUtil.genPrimaryKey());

                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

                            sysLog.setTime(df.format(new Date()));
                            sysLog.setIp(IpUtils.getIpAddr(request));

                            /*获取用户信息*/
                            if(StringUtils.isEmpty(userInfo)){
                             sysLog.setUserId("1");
                            }else{
                                sysLog.setUserId(userInfo.getId());
                            }





                            //调用service保存SysLog实体类到数据库
                            sysLogService.save(sysLog);

                            break;
                        }
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }









        try {
            Object result=joinPoint.proceed();
            logger.info("r:后置增强调用:" + joinPoint.getTarget() + "的"
                    +joinPoint.getSignature().getName() + "方法，方法返回值:"
                    + result);
            return result;



        }catch (Throwable throwable){
            logger.info("r:异常抛出增强调用:" + joinPoint.getTarget() + "的"
                    +joinPoint.getSignature().getName() + "方法，方法抛出的异常:"
                    + throwable);
            throw new RuntimeException();
        }finally {
            logger.info("r:最终增强调用:" + joinPoint.getTarget() + "的"
                    +joinPoint.getSignature().getName() + "方法");
        }





    }







}
