package emails;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {

    /* Email Attributes */
    final String username = "";
    final String password = "";
    final String sender = "";

    /* method to send email with login details to new user */
    public boolean sendLoginDetails(String reciever, String userID, String userPassword) {

        boolean sent = false;                       //attribute to check whether email sent or not

        /* set properties */
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            /* create message */
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
            message.setSubject("MartRunner Account Activated");
            message.setText("Your MartRunner account has been activated. You can log into the system using following details."
                    + "\n Username : " + userID
                    + "\n Password : " + userPassword
                    + "\n Please follow this link to log into MartRunner. You must set a new password in first login"
                    + "\n http://localhost:8080/MartRunner/login/firstLogin.jsp"
                    + "\n Warm Regards \n Good Market Team");

            Transport.send(message);                //send message

            sent = true;

        } catch (MessagingException e) {
            System.err.println("Mesaging Exception :" + e);
        }
        return sent;
    }

    /* method to send an email with reset password details to user */
    public boolean sendPasswordResetDeatils(String reciever) {

        boolean sent = false;                               //attribute to check whether email sent or not

        /* set properties */
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            /* create message */
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
            message.setSubject("MartRunner Password Reset");
            message.setText("Please follow this link to reset your password."
                    + "\n http://localhost:8080/MartRunner/login/resetPassword.jsp"
                    + "\n Warm Regards \n Good Market Team");

            Transport.send(message);            //send message

            sent = true;
        } catch (MessagingException e) {
            System.err.println("Messaging Exception :" + e);
        }
        return sent;
    }

    /* method to send email with remove details to admin */
    public boolean sendRemoveDetailsToAdmin(String reciever) {

        boolean sent = false;                       //attribute to check whether email sent or not

        /* set properties */
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            /* create message */
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
            message.setSubject("MartRunner Account Deactivated");
            message.setText("Your MartRunner account has been deactivated. \nYou can't log into the system because"
                    + " you are not an registered admin of the Good Market Team further. \nThank you for your support given to the Good Market!. "
                    + "\n \nWarm Regards \nGood Market Team");

            Transport.send(message);                //send message

            sent = true;

        } catch (MessagingException e) {
            System.err.println("Mesaging Exception :" + e);
        }
        return sent;
    }

    /* method to send email with remove details to vendor */
    public boolean sendRemoveDetailsToVendor(String reciever, String removeType) {

        boolean sent = false;                       //attribute to check whether email sent or not

        /* set properties */
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            /* create message */
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
            message.setSubject("MartRunner Account Deactivated");

            if (removeType.equals("hidden")) {
                message.setText("Your MartRunner account has been deactivated. \nYou have been removed from the vendor list."
                        + "\nThank you for your support given to the Good Market!. "
                        + "\n \nWarm Regards \nGood Market Team");
            } else {
                message.setText("Your MartRunner account has been deactivated. \nYou have been removed from current vendor list"
                        + " and added to blacklist group. \nThank you for your support given to the Good Market!. "
                        + "\n \nWarm Regards \nGood Market Team");
            }
            Transport.send(message);                //send message

            sent = true;

        } catch (MessagingException e) {
            System.err.println("Mesaging Exception :" + e);
        }
        return sent;
    }

    /* method to send email with reactivated details to vendor */
    public boolean sendReactivatedDetailsToVendor(String reciever) {

        boolean sent = false;                       //attribute to check whether email sent or not

        /* set properties */
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            /* create message */
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
            message.setSubject("MartRunner Account Re-activated");

            message.setText("Your MartRunner account has been re-activated. \nYou can log into the system again."
                    + "\nWelcome again to the Good Market team and happy to work with again!. "
                    + "\n \nWarm Regards \nGood Market Team");

            Transport.send(message);                //send message

            sent = true;

        } catch (MessagingException e) {
            System.err.println("Mesaging Exception :" + e);
        }
        return sent;
    }
    
    /* method to send email with product approval details to vendor */
    public boolean sendProductApprovalMailToVendor(String reciever) {

        boolean sent = false;                       //attribute to check whether email sent or not

        /* set properties */
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            /* create message */
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
            message.setSubject("MartRunner New Product Request Approved ");

            message.setText("Your product request has been approved and added to your product list"
                    + "\n \nWarm Regards \nGood Market Team");

            Transport.send(message);                //send message

            sent = true;

        } catch (MessagingException e) {
            System.err.println("Mesaging Exception :" + e);
        }
        return sent;
    }
    
    /* method to send email with product rejection details to vendor */
    public boolean sendProductRejectionMailToVendor(String reciever) {

        boolean sent = false;                       //attribute to check whether email sent or not

        /* set properties */
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            /* create message */
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
            message.setSubject("MartRunner New Product Request Approved ");

            message.setText("Your product request has been rejected."
                    + "\n Please contact us for further details"
                    + "\n \nWarm Regards \nGood Market Team");

            Transport.send(message);                //send message

            sent = true;

        } catch (MessagingException e) {
            System.err.println("Mesaging Exception :" + e);
        }
        return sent;
    }
    
     /* method to send email with promotional post approval details to vendor */
    public boolean sendPostApprovalMailToVendor(String reciever) {

        boolean sent = false;                       //attribute to check whether email sent or not

        /* set properties */
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            /* create message */
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
            message.setSubject("MartRunner Promotional Post Request Approved ");

            message.setText("Your promotional post request has been approved and it is visible in your profile page"
                    + "\n \nWarm Regards \nGood Market Team");

            Transport.send(message);                //send message

            sent = true;

        } catch (MessagingException e) {
            System.err.println("Mesaging Exception :" + e);
        }
        return sent;
    }
    
    /* method to send email with promotional post rejection details to vendor */
    public boolean sendPostRejectionMailToVendor(String reciever) {

        boolean sent = false;                       //attribute to check whether email sent or not

        /* set properties */
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            /* create message */
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(reciever));
            message.setSubject("MartRunner Promotional Post Request Approved ");

            message.setText("Your promotional post request has been rejected due to unavoidable circumstances."
                    + "\n Please contact us for further details"
                    + "\n \nWarm Regards \nGood Market Team");

            Transport.send(message);                //send message

            sent = true;

        } catch (MessagingException e) {
            System.err.println("Mesaging Exception :" + e);
        }
        return sent;
    }
}
