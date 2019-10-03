/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;




/**
 *
 * @author acer
 */
public class daoimpl implements daointerface {
    
    HibernateTemplate hb;

    /**
     * @return the hb
     */
    public HibernateTemplate getHb() {
        return hb;
    }

    /**
     * @param hb the hb to set
     */
    public void setHb(HibernateTemplate hb) {
        this.hb = hb;
    }

    @Override
    public void insert(Register r) {
            hb.save(r);
    }



    @Override
    public List getusers(String email) {
        List li=hb.find("from Register r where r.email=?",email);
        return li; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List viewusers() {
        List li=hb.find("from Register r where r.aprstats='approved'");
        return li; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List waiting() {
        List li=hb.find("from Register r where r.aprstats='pending'");
        return li; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void change(int id) {
        SessionFactory sf=hb.getSessionFactory();
        Session ses=sf.openSession();
        Transaction t=ses.beginTransaction();
        String query="update Register r set r.aprstats='approved' where r.id= :a";
        Query q=ses.createQuery(query);
        q.setParameter("a", id);
        q.executeUpdate();
        t.commit();
        ses.close();
         //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void save(Encrypt e) {
            
        hb.save(e);

    }

    @Override
    public List getfiles(int uid) {
        List li=hb.find("from Encrypt e where e.rid=?",uid);
        return li;
    }

    @Override
    public List getall(int uid) {
        SessionFactory sf=hb.getSessionFactory();
        Session ses=sf.openSession();
        Transaction t=ses.beginTransaction();
        String query="from Register r where r.id!= :a";
        Query q=ses.createQuery(query);
        q.setParameter("a", uid);
        List li=q.list();
        return li; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void changeshare(int fileid, String sha) {
        SessionFactory sf=hb.getSessionFactory();
        Session ses=sf.openSession();
        Transaction t=ses.beginTransaction();
        String query="update Encrypt e set e.sharestats= :b,e.requeststats='unset',e.requestby='unset' where e.id= :a";
        Query q=ses.createQuery(query);
        q.setParameter("a", fileid);
        q.setParameter("b", sha);
        q.executeUpdate();
        t.commit();
        ses.close();
    }

    @Override
    public List getshared(int id, String mail) {
        SessionFactory sf=hb.getSessionFactory();
        Session ses=sf.openSession();
        Transaction t=ses.beginTransaction();
        String query="from Encrypt e where (e.sharestats='public' or e.sharestats= :a) and (e.rid!= :b)";
        Query q=ses.createQuery(query);
        q.setParameter("a", mail);
        q.setParameter("b", id);
        List li=q.list();
        return li;
    }

    @Override
    public void request(int fileid, String email) {
        SessionFactory sf=hb.getSessionFactory();
        Session ses=sf.openSession();
        Transaction t=ses.beginTransaction();
        String query="update Encrypt e set e.requeststats='requested',e.requestby= :a,e.sharestats='unset' where e.id= :b";
       Query q=ses.createQuery(query);
        q.setParameter("a", email);
        q.setParameter("b", fileid);
        q.executeUpdate();
        t.commit();
        ses.close();
    }

    @Override
    public List requested(int id) {
        List li=hb.find("from Encrypt e where e.requeststats='requested' and e.rid=?",id);
        return li; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void changerequest(int fileid) {
        SessionFactory sf=hb.getSessionFactory();
        Session ses=sf.openSession();
        Transaction t=ses.beginTransaction();
        String query="update Encrypt e set e.requeststats='approved' where e.id= :a";
        Query q=ses.createQuery(query);
        q.setParameter("a", fileid);
        q.executeUpdate();
        t.commit();
        ses.close();
    }

    @Override
    public List received(String email) {
        List li=hb.find("from Encrypt e where e.requeststats='approved' and e.requestby=?",email);
        return li; //To change body of generated methods, choose Tools | Templates.
    }

    List getemailofrequestedguy(int fileid) {
       List li=hb.find("from Encrypt e where e.id=?",fileid);
       return li;
    }






}
