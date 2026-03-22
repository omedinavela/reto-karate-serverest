package runners;

import com.intuit.karate.junit5.Karate;

public class UsersRunner {

    @Karate.Test
    Karate runAllUsersTests() {
        return Karate.run(
                "classpath:features/users/users-get.feature",
                "classpath:features/users/users-post.feature",
                "classpath:features/users/users-get-by-id.feature",
                "classpath:features/users/users-put.feature",
                "classpath:features/users/users-delete.feature",
                "classpath:features/users/users-e2e.feature"
        ).relativeTo(getClass());
    }
}
