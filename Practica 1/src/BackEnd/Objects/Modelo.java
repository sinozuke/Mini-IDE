/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd.Objects;

import java.awt.Toolkit;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTree;
import javax.swing.event.TreeModelEvent;
import javax.swing.event.TreeModelListener;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.MutableTreeNode;
import javax.swing.tree.TreePath;
import javax.swing.tree.TreeSelectionModel;

/**
 *
 * @author Songoku
 */
public class Modelo extends JPanel implements TreeSelectionListener {
   
    protected DefaultMutableTreeNode Raiz_Proyectos;
    protected DefaultTreeModel Modelos_de_proyectos;
    protected JTree tree;
    protected Toolkit toolkit = Toolkit.getDefaultToolkit();
    

    public Modelo() {
        Raiz_Proyectos = new DefaultMutableTreeNode("Proyectos Abiertos");
        Modelos_de_proyectos = new DefaultTreeModel(Raiz_Proyectos);
        Modelos_de_proyectos.addTreeModelListener(new MyTreeModelListener());
        tree.addTreeSelectionListener(this);
        tree=new JTree(Modelos_de_proyectos);
        tree.setEditable(false);
	tree.getSelectionModel().setSelectionMode(TreeSelectionModel.SINGLE_TREE_SELECTION);
        tree.setShowsRootHandles(true);
        
        JScrollPane scrollpane = new JScrollPane();
        add(scrollpane);
        tree.addTreeSelectionListener(this);
    }
    
    public void limpiar() {
        Raiz_Proyectos.removeAllChildren();
        Modelos_de_proyectos.reload();
    }
    
    public void QuitarNodoActual() {
        TreePath currentSelection = tree.getSelectionPath();
        if (currentSelection != null) {
            DefaultMutableTreeNode currentNode = (DefaultMutableTreeNode)
                         (currentSelection.getLastPathComponent());
            MutableTreeNode parent = (MutableTreeNode)(currentNode.getParent());
            if (parent != null) {
                Modelos_de_proyectos.removeNodeFromParent(currentNode);
                return;
            }
        } 

        // Either there was no selection, or the root was selected.
        toolkit.beep();
    }
    
    public DefaultMutableTreeNode addObject(Object child) {
        DefaultMutableTreeNode parentNode = null;
        TreePath parentPath = tree.getSelectionPath();

        if (parentPath == null) {
            parentNode = Raiz_Proyectos;
        } else {
            parentNode = (DefaultMutableTreeNode)
                         (parentPath.getLastPathComponent());
        }

        return addObject(parentNode, child, true);
    }

    public DefaultMutableTreeNode addObject(DefaultMutableTreeNode parent, Object child) {
        return addObject(parent, child, false);
    }

    public DefaultMutableTreeNode addObject(DefaultMutableTreeNode parent, Object child, boolean shouldBeVisible) {
        DefaultMutableTreeNode childNode = 
                new DefaultMutableTreeNode(child);

        if (parent == null) {
            parent = Raiz_Proyectos;
        }
	
	//It is key to invoke this on the TreeModel, and NOT DefaultMutableTreeNode
        Modelos_de_proyectos.insertNodeInto(childNode, parent, 
                                 parent.getChildCount());

        //Make sure the user can see the lovely new node.
        if (shouldBeVisible) {
            tree.scrollPathToVisible(new TreePath(childNode.getPath()));
        }
        return childNode;
    }

    @Override
    public void valueChanged(TreeSelectionEvent e) {
        DefaultMutableTreeNode node = (DefaultMutableTreeNode)
                           tree.getLastSelectedPathComponent();

        if (node == null) return;

        Object nodeInfo = node.getUserObject();
        if (node.isLeaf()) {
            Archivo arch = (Archivo)nodeInfo;
            String codigo = arch.getCodigo();
            //Metodo para Vizualizar "Codigo" del Archivo
        } else {
            //no se deveria hacer nada por ser carpeta 
        }
    }
    
    class MyTreeModelListener implements TreeModelListener {
    
        @Override
        public void treeNodesChanged(TreeModelEvent e) {
            DefaultMutableTreeNode node;
            node = (DefaultMutableTreeNode)(e.getTreePath().getLastPathComponent());

            /*
             * If the event lists children, then the changed
             * node is the child of the node we've already
             * gotten.  Otherwise, the changed node and the
             * specified node are the same.
             */

                int index = e.getChildIndices()[0];
                node = (DefaultMutableTreeNode)(node.getChildAt(index));

            System.out.println("The user has finished editing the node.");
            System.out.println("New value: " + node.getUserObject());
        }
        
        @Override
        public void treeNodesInserted(TreeModelEvent e) {
        }
        
        @Override
        public void treeNodesRemoved(TreeModelEvent e) {
        }
        
        @Override
        public void treeStructureChanged(TreeModelEvent e) {
        }
    }
}