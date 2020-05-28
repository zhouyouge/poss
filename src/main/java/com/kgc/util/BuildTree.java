package com.kgc.util;


import com.kgc.entity.Tree;

import java.util.ArrayList;
import java.util.List;


/**
 * 构建tree
 * TODO
 * <br>
 * @author kangxu2 2017-1-7
 *
 */
public class BuildTree {

    /**
     *
     * TODO
     * <br>
     * @author kangxu2 2017-1-7
     *
     * @param nodes
     * @return
     */
    public static <T> Tree<T> build(List<Tree<T>> nodes) {

        if(nodes == null){
            return null;
        }
        List<Tree<T>> topNodes = new ArrayList<Tree<T>>();

        for (Tree<T> children : nodes) {

            String pid = children.getParent_itemtypeid();
            if (pid == null || "".equals(pid) || pid.equals("0")) {
                topNodes.add(children);

                continue;
            }

            for (Tree<T> parent : nodes) {
                String id = parent.getId();
                if (id != null && id.equals(pid)) {
                    parent.getChildren().add(children);
                    children.setParent(true);
                    parent.setChildren(true);
                    parent.setAttributes(parent.getAttributes());
                    continue;
                }
            }

        }

        Tree<T> root = new Tree<T>();
        if (topNodes.size() == 1) {
            root = topNodes.get(0);
        } else {
            root.setId("-1");
            root.setParent_itemtypeid("");
            root.setParent(false);
            root.setChildren(true);
            root.setChecked(true);
            root.setChildren(topNodes);
            root.setLevelName("顶级节点");
            root.setName("数据管理");
        }

        return root;
    }

}
