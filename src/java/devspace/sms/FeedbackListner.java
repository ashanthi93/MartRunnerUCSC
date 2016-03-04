package devspace.sms;

import classes.SMS;
import classes.Vendor;
import hms.kite.samples.api.SdpException;
import hms.kite.samples.api.sms.MoSmsListener;
import hms.kite.samples.api.sms.SmsRequestSender;
import hms.kite.samples.api.sms.messages.MoSmsReq;
import hms.kite.samples.api.sms.messages.MtSmsReq;
import hms.kite.samples.api.sms.messages.MtSmsResp;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

public class FeedbackListner implements MoSmsListener {

    String message, sourceAddress, feedback, vendorID, mobileNum;

    int paymentStatus, updateStatus;

    @Override
    public void init() {

    }

    @Override
    public void onReceivedSms(MoSmsReq receivedMsg) {
        message = receivedMsg.getMessage();                         //get msg content
        sourceAddress = receivedMsg.getSourceAddress();             //get source address

        FeedbackService.addFeedback(sourceAddress, message);

        mobileNum = "0" + sourceAddress.substring(6);

        if (message.equalsIgnoreCase("TH 1")) {
            try {
                SMS sms = new SMS(message, mobileNum);           //create sms object to update database
                vendorID = sms.searchMobileNumber();             //check whether number is valid and belongs to a vendor

                if (!(vendorID.equals(""))) {
                    Vendor vendor = new Vendor();                   //create vendor object to set attendance status
                    vendor.setVendorID(vendorID);                   //set vendorID

                    paymentStatus = vendor.checkPayment("TH");          //check vendor paid for market

                    if (paymentStatus == 1) {
                        feedback = checkAttendancePeriodThursday(vendor, 1);
                    } else if (paymentStatus == -1) {
                        feedback = "Error!. You haven't paid for next market day.";
                    } else {
                        feedback = "Error!. You are not belonging to Thursday Market.";
                    }
                } else {
                    feedback = "Error!. You are not a registered vendor or your mobile number is not saved in the system.";
                }
            } catch (SQLException e) {
                System.err.println("SQLError : " + e);
            } catch (ParseException e) {
                System.err.println("ParseException : " + e);
            }
        } else if (message.equalsIgnoreCase("SA 1")) {
            try {
                SMS sms = new SMS(message, mobileNum);           //create sms object to update database
                vendorID = sms.searchMobileNumber();             //check whether number is valid and belongs to a vendor

                if (!(vendorID.equals(""))) {
                    Vendor vendor = new Vendor();                   //create vendor object to set attendance status
                    vendor.setVendorID(vendorID);                   //set vendorID

                    paymentStatus = vendor.checkPayment("SA");          //check vendor paid for market

                    if (paymentStatus == 1) {
                        feedback = checkAttendancePeriodSaturday(vendor, 1);
                    } else if (paymentStatus == -1) {
                        feedback = "Error!. You haven't paid for next market day.";
                    } else {
                        feedback = "Error!. You are not belonging to Saturday Market.";
                    }
                } else {
                    feedback = "Error!. You are not a registered vendor or your mobile number is not saved in the system.";
                }
            } catch (SQLException e) {
                System.err.println("SQLError : " + e);
            } catch (ParseException e) {
                System.err.println("Parse Exception : " + e);
            }
        } else if (message.equalsIgnoreCase("TH 0")) {
            try {
                SMS sms = new SMS(message, mobileNum);           //create sms object to update database
                vendorID = sms.searchMobileNumber();             //check whether number is valid and belongs to a vendor

                if (!(vendorID.equals(""))) {
                    Vendor vendor = new Vendor();                   //create vendor object to set attendance status
                    vendor.setVendorID(vendorID);                   //set vendorID

                    paymentStatus = vendor.checkPayment("TH");          //check vendor paid for market

                    if (paymentStatus == 1) {
                        feedback = checkAttendancePeriodThursday(vendor, 0);
                    } else if (paymentStatus == -1) {
                        feedback = "Error!. You haven't paid for next market day.";
                    } else {
                        feedback = "Error!. You are not belonging to Thursday Market.";
                    }
                } else {
                    feedback = "Error!. You are not a registered vendor or your mobile number is not saved in the system.";
                }
            } catch (SQLException e) {
                System.err.println("SQLError : " + e);
            } catch (ParseException e) {
                System.err.println("Parse Exception : " + e);
            }
        } else if (message.equalsIgnoreCase("SA 0")) {
            try {
                SMS sms = new SMS(message, mobileNum);           //create sms object to update database
                vendorID = sms.searchMobileNumber();             //check whether number is valid and belongs to a vendor

                if (!(vendorID.equals(""))) {
                    Vendor vendor = new Vendor();                   //create vendor object to set attendance status
                    vendor.setVendorID(vendorID);                   //set vendorID

                    paymentStatus = vendor.checkPayment("SA");          //check vendor paid for market

                    if (paymentStatus == 1) {
                        feedback = checkAttendancePeriodSaturday(vendor, 0);
                    } else if (paymentStatus == -1) {
                        feedback = "Error!. You haven't paid for next market day.";
                    } else {
                        feedback = "Error!. You are not belonging to Saturday Market.";
                    }
                } else {
                    feedback = "Error!. You are not a registered vendor or your mobile number is not saved in the system.";
                }
            } catch (SQLException e) {
                System.err.println("SQLError : " + e);
            } catch (ParseException e) {
                System.err.println("Parse Exception : " + e);
            }
        } else {
            feedback = "Sorry your message content is invalid. \n Please use 'TH 0' or 'SA 0' if you are not attending market else 'TH 1' or 'SA 1' if you attend market this week. \n 'TH' is for Thursday market and 'SA' is for Saturday market.";
        }

        sendResponse(receivedMsg);                     //to send response to vendor
    }

    public void sendResponse(MoSmsReq receivedMsg) {
        try {

            MtSmsReq responseMsg = new MtSmsReq();

            responseMsg.setMessage(feedback);
            responseMsg.setApplicationId("App_0001");
            responseMsg.setPassword("password");
            responseMsg.setDestinationAddresses(Arrays.asList(receivedMsg.getSourceAddress()));

            SmsRequestSender requestSender = new SmsRequestSender(new URL("http://localhost:7000/sms/send"));
            MtSmsResp smsResponse = requestSender.sendSmsRequest(responseMsg);

            System.out.println("Response " + smsResponse);

        } catch (SdpException e) {
            System.err.println("Error " + e);
        } catch (MalformedURLException e) {
            System.err.println("Error " + e);
        }
    }

    public String checkAttendancePeriodThursday(Vendor vendor, int status) throws ParseException, SQLException {

        String feedbackMsg = null;

        int prvStatus = Integer.parseInt(vendor.getAttendanceStatus("TH"));

        if (prvStatus != status) {

            Date expiredDate = vendor.getExpiredDate();
            Date currentDate = Date.from(Instant.now());

            if (expiredDate.compareTo(currentDate) > 0) {
                Calendar calendar = Calendar.getInstance();

                //current day of the week
                int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

                SimpleDateFormat parser = new SimpleDateFormat("HH:mm:ss");

                //closing time of the attendance
                Date closeTime = parser.parse("17:00:00");

                //current time when attendance confirm
                Date currentTime = calendar.getTime();

                /* Check current day is included inside the confirmation period*/
                if (!(dayOfWeek > 2 && dayOfWeek < 6)) {

                    /* Check confirmation is before 5pm on monday*/
                    if (dayOfWeek == 2 && (compareTimes(closeTime, currentTime) > 0)) {

                        updateStatus = vendor.confirmAttendance("TH", status);           //update attendance status

                        System.out.println("Upda  :" + updateStatus);

                        if (updateStatus == 1) {
                            if (status == 1) {
                                feedbackMsg = "Your attendance status updated to confirm list in Thursday Market. Thank You!";
                            } else {
                                feedbackMsg = "Your attendance status updated to not-confirm list in Thursday Market. Thank You!";
                            }
                        } else {
                            feedbackMsg = "Error!. An error occured in changing your attendance status.";
                        }

                    } else if (dayOfWeek == 1 || dayOfWeek == 6 || dayOfWeek == 7) {

                        updateStatus = vendor.confirmAttendance("TH", status);           //update attendance status

                        System.out.println("Upda  :" + updateStatus);

                        if (updateStatus == 1) {
                            if (status == 1) {
                                feedbackMsg = "Your attendance status updated to confirm list in Thursday Market. Thank You!";
                            } else {
                                feedbackMsg = "Your attendance status updated to not-confirm list in Thursday Market. Thank You!";
                            }
                        } else {
                            feedbackMsg = "Error!. An error occured in changing your attendance status.";
                        }
                    } else {
                        feedbackMsg = "Sorry!. Attendance Confirmation time is over.";             //Output error if confirmation is after 5pm on monday
                    }
                } else {
                    feedbackMsg = "Sorry!. Attendance Confirmation is closed for this week.";      //Output error if attendance period is over (inbetween tuesday to thursday)
                }
            } else {
                feedbackMsg = "Sorry!. Your payment has expired for Thursday Market!";                 //Output error if payment period is over
            }
        } else {
            feedbackMsg = "Your current attendance status is same so no change happens.";                 //Output error if no change
        }
        return feedbackMsg;
    }

    public String checkAttendancePeriodSaturday(Vendor vendor, int status) throws ParseException, SQLException {

        String feedbackMsg = null;

        int prvStatus = Integer.parseInt(vendor.getAttendanceStatus("SA"));

        if (prvStatus != status) {

            Date expiredDate = vendor.getExpiredDate();
            Date currentDate = Date.from(Instant.now());

            if (expiredDate.compareTo(currentDate) > 0) {
                Calendar calendar = Calendar.getInstance();

                //current day of the week
                int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

                SimpleDateFormat parser = new SimpleDateFormat("HH:mm:ss");

                //closing time of the attendance
                Date closeTime = parser.parse("17:00:00");

                //current time when attendance confirm
                Date currentTime = calendar.getTime();

                /* Check current day is included inside the confirmation period*/
                if (!(dayOfWeek > 2 && dayOfWeek <= 7)) {

                    /* Check confirmation is before 5pm on monday*/
                    if (dayOfWeek == 2 && (compareTimes(closeTime, currentTime) > 0)) {
                        updateStatus = vendor.confirmAttendance("SA", status);           //update attendance status
                        if (updateStatus == 1) {
                            if (status == 1) {
                                feedbackMsg = "Your attendance status updated to confirm list in Saturday Market. Thank You!";
                            } else {
                                feedbackMsg = "Your attendance status updated to not-confirm list in Saturday Market. Thank You!";
                            }
                        } else {
                            feedbackMsg = "Error!. An error occured in changing your attendance status.";
                        }
                    } else if (dayOfWeek == 1) {
                        updateStatus = vendor.confirmAttendance("SA", status);           //update attendance status
                        if (updateStatus == 1) {
                            if (status == 1) {
                                feedbackMsg = "Your attendance status updated to confirm list in Saturday Market. Thank You!";
                            } else {
                                feedbackMsg = "Your attendance status updated to not-confirm list in Saturday Market. Thank You!";
                            }
                        } else {
                            feedbackMsg = "Error!. An error occured in changing your attendance status.";
                        }
                    } else {
                        feedbackMsg = "Sorry!. Attendance Confirmation time is over.";             //Output error if confirmation is after 5pm on monday
                    }
                } else {
                    feedbackMsg = "Sorry!. Attendance Confirmation is closed for this week.";      //Output error if attendance period is over (inbetween tuesday to thursday)
                }
            } else {
                feedbackMsg = "Sorry!. Your payment has expired for Saturday Market!";                 //Output error if payment period is over
            }
        } else {
            feedbackMsg = "Your current attendance status is same so no change happens.";                 //Output error if no change
        }
        return feedbackMsg;
    }

    public int compareTimes(Date d1, Date d2) {
        int t1;
        int t2;

        t1 = (int) (d1.getTime() % (24 * 60 * 60 * 1000L));
        t2 = (int) (d2.getTime() % (24 * 60 * 60 * 1000L));

        return (t1 - t2);
    }
}
