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
public interface daointerface {
    
    public void insert(Register r);
    public List getusers(String email);
    public List viewusers();
    public List waiting();
    public void change(int id);
    public void save(Encrypt e);
    public List getfiles(int uid);
    public List getall(int uid);
    public void changeshare(int fileid,String sha);
    public List getshared(int id,String mail);
    public void request(int fileid,String email);
    public List requested(int id);
    public void changerequest(int fileid);
    public List received(String email);
}
