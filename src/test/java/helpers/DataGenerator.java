package helpers;

import java.util.UUID;

public class DataGenerator {

    public static String randomEmail() {
        return "qa_" + UUID.randomUUID() + "@mail.com";
    }

    public static String randomName() {
        return "Usuario QA " + UUID.randomUUID().toString().substring(0, 8);
    }

    public static String randomPassword() {
        return "Test1234";
    }
}
