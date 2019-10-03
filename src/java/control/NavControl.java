/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.Writer;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import javax.imageio.ImageIO;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 * @author acer
 */
@Controller
public class NavControl {
    
    public static int flag=0;
    public static String finalmsg="";
    @Autowired serviceinterface se;
    
    @RequestMapping(value="home.html",method=RequestMethod.GET)
    
    public String gethome()
    {
        return "home";
    }
    
    @RequestMapping(value="registration.html",method=RequestMethod.GET)
    
    public String getregistration()
    {
        
        return "registration";
    }
    
    @RequestMapping(value="registration.html",method=RequestMethod.POST)
    
    public String getregister(@RequestParam String fname,@RequestParam String femail,@RequestParam String cname,@RequestParam String address,@RequestParam String address1,@RequestParam String phone,@RequestParam String rpassword)
    {
        Register r=new Register();
        r.setName(fname);
        r.setEmail(femail);
        r.setAddress(address);
        r.setAddress2(address1);
        r.setCname(cname);
        r.setPhone(phone);
        r.setPassword(rpassword);
        r.setAprstats("pending");
        se.insert(r);
        
        return "redirect:home.html";
    }
    
    @RequestMapping(value="admin.html",method=RequestMethod.GET)
    
    public String admin()
    {
        return "admin";
    }
    
    @RequestMapping(value="userdash.html",method=RequestMethod.GET)
    
    public String userdash()
    {
        return "userdash";
    }
        
    @RequestMapping(value="logout.html",method=RequestMethod.GET)
    
    public String logout()
            {
                return "logout";
            }
    
    
    @RequestMapping(value="home.html",method=RequestMethod.POST)
    
    public String tologin(@RequestParam String email,@RequestParam String password,ModelMap m,HttpSession ses)
    {
        
        List li=se.getusers(email);
       
        if(li.isEmpty())
        {
            m.put("message","no");
        }
        
        Iterator it=li.iterator();
        
       
        if(email.equals("admin")&&password.equals("admin"))
                {
                    
                    return "redirect:admin.html";
                }
        else
        {
            while(it.hasNext())
            {
                Register r=(Register) it.next();
                if(r.getEmail().equals(email)&&r.getPassword().equals(password)&&r.getAprstats().equals("approved"))
                {
                   
                    ses.setAttribute("idd", r.getId());
                    ses.setAttribute("name", r.getName());
                    ses.setAttribute("em", r.getEmail());
                    return "redirect:home.html";
                    
                }
                else
                {
                    m.put("message","no");
                   
                }
                
            }
            
            
        }
            
        return "home";
    }
    
    @RequestMapping(value="viewusers.html",method=RequestMethod.GET)
    
    public String viewusers(ModelMap m)
    {
        List li=se.viewusers();
        m.put("list", li);
        return "viewusers";
    }
    
    @RequestMapping(value="waiting.html",method=RequestMethod.GET)
    
    public String waiting(ModelMap m)
    {
        List li=se.waiting();
        m.put("list", li);
        return "waiting";
    }
    
    @RequestMapping(value="changestatus.html")
    
    public String approve(@RequestParam int Id)
    {
        se.change(Id);
        return "redirect:waiting.html";
    }
    
    @RequestMapping(value="encrypt.html",method=RequestMethod.GET)
    
    public String getEncrypt()
    {
        return "encrypt";
    }
    
    @RequestMapping(value="encrypt.html",method=RequestMethod.POST)
    
    public String Encrypt(@RequestParam("file") CommonsMultipartFile file,@RequestParam String docname,@RequestParam String msg,@RequestParam String dpass,HttpSession ses) throws IOException, SQLException, URISyntaxException
    {
        int rd=(int) ses.getAttribute("idd");
        String mail=(String) ses.getAttribute("em");
        System.out.println(rd);
        String UPLOADED_FOLDER = "C:\\Users\\acer\\Documents\\WebApplication1\\encrypted_files\\";
        byte[] bytes=file.getBytes();
        Path p=Paths.get(UPLOADED_FOLDER+file.getOriginalFilename());
        Files.write(p, bytes);
        BufferedImage sourceImage = null, embeddedImage = null;
        File f=null;
        String message=msg;
//        String path=file.getOriginalFilename();
//        String replace;
//        replace = filename.replaceAll("\\\\", "\\\\\\\\");
//        String fname=replace+"\b"+path;
        f=new File(UPLOADED_FOLDER+"//"+file.getOriginalFilename());
        if(f.exists())
        {
            System.out.println("exists");
        }
        System.out.println("The file is"+f);
        sourceImage=ImageIO.read(f);
        embeddedImage=sourceImage.getSubimage(0, 0, sourceImage.getWidth(), sourceImage.getHeight());
        embedMessage(embeddedImage, message);
        if(embeddedImage == null) 
            {System.out.println("No message embedded");}
        f = new File(UPLOADED_FOLDER+"//"+rd+"_"+docname+"_"+file.getOriginalFilename());
        System.out.println("New File Path"+f);
        if(f.exists())
                {
                    f.delete();
                    
                }
                    ImageIO.write(embeddedImage, "png", f);
                    System.out.println("Done");
       Encrypt e=new Encrypt();
       e.setRid(rd);
       e.setDocname(docname);
       e.setPass(dpass);
       e.setFilepath(f.getAbsolutePath());
       e.setSharestats("unset");
       e.setSharedby(mail);
       e.setRequeststats("unset");
       e.setRequestby("unset");
//       String path=f.getAbsolutePath();
//        System.out.println(path);
//        BufferedImage im=ImageIO.read(f);
//        ByteArrayOutputStream baos = new ByteArrayOutputStream();
//        ImageIO.write( im, "jpg", baos );
//        baos.flush();
//        byte[] imageInByte = baos.toByteArray();
       
       
       se.save(e);
        return "redirect:encrypt.html";
    }

        private static void embedMessage(BufferedImage img, String mess) {
        
        int messageLength=mess.length();
        int imageWidth = img.getWidth(), imageHeight = img.getHeight(),
       imageSize = imageWidth * imageHeight;
          if(messageLength * 8 + 32 > imageSize) {
              flag=0;
              System.out.println("Message too long for Image");
              JOptionPane.showMessageDialog(null, "Message too long for Image");
       }
          else
          {
              
              flag=1;
          embedInteger(img, messageLength, 0, 0);
          byte b[] = mess.getBytes();
            for(int i=0; i<b.length; i++)
            embedByte(img, b[i], i*8+32, 0);
          }
    }

        private static void embedInteger(BufferedImage img, int n, int start, int storageBit) {
        
        int maxX = img.getWidth(), maxY = img.getHeight(), 
        startX = start/maxY, startY = start - startX*maxY, count=0;
        for(int i=startX; i<maxX && count<32; i++) {
        for(int j=startY; j<maxY && count<32; j++) {
          int rgb = img.getRGB(i, j), bit = getBitValue(n, count);
          rgb = setBitValue(rgb, storageBit, bit);
          img.setRGB(i, j, rgb);
          count++;
          }
       }
        
       
    }

    private static void embedByte(BufferedImage img, byte b, int start, int storageBit) {
        
            int maxX = img.getWidth(), maxY = img.getHeight(), 
             startX = start/maxY, startY = start - startX*maxY, count=0;
             for(int i=startX; i<maxX && count<8; i++) {
             for(int j=startY; j<maxY && count<8; j++) {
            int rgb = img.getRGB(i, j), bit = getBitValue(b, count);
            rgb = setBitValue(rgb, storageBit, bit);
            img.setRGB(i, j, rgb);
            count++;
          }
       }
        
    }

    private static int getBitValue(int n, int location) {
         int v = n & (int) Math.round(Math.pow(2, location));
    return v==0?0:1;
    }

    private static int setBitValue(int n, int location, int bit) {
int toggle = (int) Math.pow(2, location), bv = getBitValue(n, location);
    if(bv == bit)
       return n;
    if(bv == 0 && bit == 1)
       n |= toggle;
    else if(bv == 1 && bit == 0)
       n ^= toggle;
    return n;    
    }
    
    @RequestMapping(value="share.html",method=RequestMethod.GET)
    
    public String share(HttpSession ses,ModelMap m)
    {
        int uid=(int) ses.getAttribute("idd");
        List li=se.getfiles(uid);
        m.put("files",li);
        List li2=se.getall(uid);
        m.put("names", li2);
        return "share";
    }
    

    @RequestMapping(value="change.html")
    
    public String share(@RequestParam int fileid,@RequestParam String sh)
    {
        
        
      
        se.changeshare(fileid,sh);
        return "redirect:share.html";
    }
    
    @RequestMapping(value="sharedfiles.html",method=RequestMethod.GET)
    
    public String getShared(HttpSession ses,ModelMap m)
    {
        String mail=(String) ses.getAttribute("em");
        int id=(int) ses.getAttribute("idd");
        List li=se.getshared(id,mail);
        m.put("shared", li);
        return "sharedfiles";
    }
    
    @RequestMapping(value="request.html",method=RequestMethod.GET)
    
    public String request(@RequestParam int fileid,@RequestParam String email)
    {
        se.request(fileid,email);
        return "redirect:userdash.html";
    }
    
    @RequestMapping(value="requestedfiles.html",method=RequestMethod.GET)
    
    public String requestfiles(HttpSession ses,ModelMap m)
    {
        int id=(int) ses.getAttribute("idd");
        List li=se.requested(id);
        m.put("request", li);
        return "requestedfiles";
    }
    
    @RequestMapping(value="send.html")
    
    public String send(@RequestParam int fileid)
    {
        se.changerequest(fileid);
        
        List li=se.getemailofrequestedguy(fileid);
        Iterator it=li.iterator();
        String recemail="";
        String filepass="";
        String docname="";
        while(it.hasNext())
        {
            Encrypt e=(Encrypt) it.next();
            recemail=e.getRequestby();
            filepass=e.getPass();
            docname=e.getDocname();
        }
        
//                 String host="smtp.gmail.com";
//	   String port="587";
//	  final String userName="";    //your gmail id
//	  final String passu="";        //your gmail password
//          
//           try
//	 {
//      // sets SMTP server properties
//      Properties properties = new Properties();
//      properties.put("mail.smtp.host", host);
//      properties.put("mail.smtp.port", port);
//      properties.put("mail.smtp.auth", "true");
//      properties.put("mail.smtp.starttls.enable", "true");
//      properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//      
//      // creates a new session with an authenticator
//      Authenticator auth = new Authenticator() {
//          public PasswordAuthentication getPasswordAuthentication() {
//              return new PasswordAuthentication(userName, passu);
//          }
//      };
//
//      Session session = Session.getInstance(properties, auth);
//
//      // creates a new e-mail message
//      Message msg = new MimeMessage(session);
//
//      msg.setFrom(new InternetAddress(userName));
//      InternetAddress[] toAddresses = { new InternetAddress(recemail) };
//      msg.setRecipients(Message.RecipientType.TO, toAddresses);
//      msg.setSubject("Welcome");
//      msg.setSentDate(new Date());
//      msg.setText("The Password For Decrypting The File "+docname+" is '"+filepass+"'");
//
//      // sends the e-mail
//      Transport.send(msg);
//	 }
//	 catch(Exception e)
//	 {
//		 e.printStackTrace();
//	 }

        
        
        return "redirect:requestedfiles.html";
    }
    
    @RequestMapping(value="received.html",method=RequestMethod.GET)
    
    public String received(HttpSession ses,ModelMap m)
    {
        String email=(String) ses.getAttribute("em");
        List li=se.received(email);
        m.put("received", li);
        return "received";
    }
    
    @RequestMapping(value="decrypt.html")
    
    public String decrypt(@RequestParam String fpath,@RequestParam String dname) throws IOException
    {
        
        OutputStream os=null;
         BufferedImage image = null;
         File f=new File(fpath);
         if(f.exists())
         {
             System.out.println("exists");
         }
         image=ImageIO.read(f);
         decodedmessage(image);         
         System.out.println("Done");
           os=new FileOutputStream(new File("C:\\Users\\acer\\Desktop\\"+dname+".txt"));
           os.write(finalmsg.getBytes(), 0,finalmsg.length());
           os.flush();
           os.close();
            System.out.println(finalmsg);
       
        return "redirect:received.html";
    }
    
        private static void decodedmessage(BufferedImage image) {
        int len = extractInteger(image, 0, 0);
         byte b[] = new byte[len];
         for(int i=0; i<len; i++)
          b[i] = extractByte(image, i*8+32, 0);
         finalmsg=new String(b);
       
           System.out.println("Your Decoded Message:"+new String(b));
    }

    private static int extractInteger(BufferedImage img, int start, int storageBit) {
       int maxX = img.getWidth(), maxY = img.getHeight(), 
       startX = start/maxY, startY = start - startX*maxY, count=0;
    int length = 0;
    for(int i=startX; i<maxX && count<32; i++) {
       for(int j=startY; j<maxY && count<32; j++) {
          int rgb = img.getRGB(i, j), bit = getBitValue(rgb, storageBit);
          length = setBitValue(length, count, bit);
          count++;
          }
       }
    return length;
    }

    private static byte extractByte(BufferedImage img, int start, int storageBit) {
      int maxX = img.getWidth(), maxY = img.getHeight(), 
       startX = start/maxY, startY = start - startX*maxY, count=0;
    byte b = 0;
    for(int i=startX; i<maxX && count<8; i++) {
       for(int j=startY; j<maxY && count<8; j++) {
          int rgb = img.getRGB(i, j), bit = getBitValue(rgb, storageBit);
          b = (byte)setBitValue(b, count, bit);
          count++;
          }
       }
    return b;
    }
}
