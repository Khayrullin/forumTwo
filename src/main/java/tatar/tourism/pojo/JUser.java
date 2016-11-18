package tatar.tourism.pojo;

/**
 * Created by habar on 26.10.2016.
 */
public class JUser extends User {
    @Override
    public boolean isModerator() {
        return false;
    }

    @Override
    public boolean isJUser() {
        return true;
    }

    @Override
    public boolean isAdmin() {
        return false;
    }
}
