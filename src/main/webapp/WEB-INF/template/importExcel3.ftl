<script type="text/javascript" src="../statics/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(top.hangge());
    $(function() {
        //上传
        $('#excel').ace_file_input({
            no_file:'请选择EXCEL ...',
            btn_choose:'选择',
            btn_change:'更改',
            droppable:false,
            onchange:null,
            thumbnail:false, //| true | large
            whitelist:'xls|xls',
            blacklist:'gif|png|jpg|jpeg'
            //onchange:''
        });
    });

    //保存
    function save(){
        if($("#excel").val()=="" || document.getElementById("excel").files[0] =='请选择xls格式的文件'){

            $("#excel").tips({
                side:3,
                msg:'请选择文件',
                bg:'#AE81FF',
                time:3
            });
            return false;
        }
        $("#Form").submit();
        $("#zhongxin").hide();
        $("#zhongxin2").show();
    }
    function fileType(obj){
        var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
        if(fileType != '.xls'){
            $("#excel").tips({
                side:3,
                msg:'请上传xls格式的文件',
                bg:'#AE81FF',
                time:3
            });
            $("#excel").val('');
            document.getElementById("excel").files[0] = '请选择xls格式的文件';
        }
    }
</script>

<div class="col-xs-12">
    <form action="../importExcel3" name="Form" id="Form" method="post" enctype="multipart/form-data">
        <div id="zhongxin">
            <table style="width:95%;" >
                <tr>
                    <td style="padding-top: 20px;text-align: center;"><input type="file" id="excel" name="excel" style="width:200px;" onchange="fileType(this)" /></td>
                </tr>
                <tr>
                    <td style="text-align: center;padding-top: 10px;">
                        <a onclick="save();">导入</a>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</div>