package devspace.sms;

import java.util.HashMap;
import java.util.Map;

public class FeedbackService {

    private static final Map<String, String> subscriberFeedback = new HashMap<String, String>();

    public static void addFeedback(String subscriberId, String message) {
        subscriberFeedback.put(subscriberId, message);
    }

    public static Map<String, String> getFeedback() {
        return subscriberFeedback;
    }
}
