/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.sql.Blob;

/**
 *
 * @author acer
 */
public class Encrypt {

 
    
    private int id;
    private int rid;
    private String filepath; 
    private String docname;
    private String pass;
    private String sharestats;
    private String sharedby;
    private String requeststats;
    private String requestby;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the rid
     */
    public int getRid() {
        return rid;
    }

    /**
     * @param rid the rid to set
     */
    public void setRid(int rid) {
        this.rid = rid;
    }

    /**
     * @return the image
     */


    /**
     * @return the docname
     */
    public String getDocname() {
        return docname;
    }

    /**
     * @param docname the docname to set
     */
    public void setDocname(String docname) {
        this.docname = docname;
    }

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }


   
    /**
     * @return the filepath
     */
    public String getFilepath() {
        return filepath;
    }

    /**
     * @param filepath the filepath to set
     */
    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    /**
     * @return the sharestats
     */
    public String getSharestats() {
        return sharestats;
    }

    /**
     * @param sharestats the sharestats to set
     */
    public void setSharestats(String sharestats) {
        this.sharestats = sharestats;
    }

    /**
     * @return the sharedby
     */
    public String getSharedby() {
        return sharedby;
    }

    /**
     * @param sharedby the sharedby to set
     */
    public void setSharedby(String sharedby) {
        this.sharedby = sharedby;
    }

    /**
     * @return the requeststats
     */
    public String getRequeststats() {
        return requeststats;
    }

    /**
     * @param requeststats the requeststats to set
     */
    public void setRequeststats(String requeststats) {
        this.requeststats = requeststats;
    }

    /**
     * @return the requestby
     */
    public String getRequestby() {
        return requestby;
    }

    /**
     * @param requestby the requestby to set
     */
    public void setRequestby(String requestby) {
        this.requestby = requestby;
    }


    
}
