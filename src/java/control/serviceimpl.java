/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.util.List;


/**
 *
 * @author acer
 */
public class serviceimpl implements serviceinterface {
    
     daoimpl sd;
            

    /**
     * @return the sd
     */
    public daoimpl getSd() {
        return sd;
    }

    /**
     * @param sd the sd to set
     */
    public void setSd(daoimpl sd) {
        this.sd = sd;
    }



  
    @Override
    public void insert(Register r) {
        sd.insert(r);
    }

    @Override
    public List getusers(String email) {
        
        return sd.getusers(email);
    }

    @Override
    public List viewusers() {
        return sd.viewusers(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List waiting() {
        return sd.waiting(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void change(int id) {
        sd.change(id);
    }

    @Override
    public void save(Encrypt e) {
        
        sd.save(e);
    }

    @Override
    public List getfiles(int uid) {
        
        return sd.getfiles(uid);
    }

    @Override
    public List getall(int uid) {
        return sd.getall(uid); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void changeshare(int fileid, String sha) {
        sd.changeshare(fileid,sha);
    }

    @Override
    public List getshared(int id, String mail) {
        return sd.getshared(id,mail); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void request(int fileid, String email) {
    sd.request(fileid,email);
    }

    @Override
    public List requested(int id) {
        return sd.requested(id); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void changerequest(int fileid) {
        sd.changerequest(fileid);
    }

    @Override
    public List received(String email) {
        return sd.received(email); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List getemailofrequestedguy(int fileid) {
        return sd.getemailofrequestedguy(fileid); //To change body of generated methods, choose Tools | Templates.
    }




    

}
