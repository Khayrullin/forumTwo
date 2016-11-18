package tatar.tourism.pojo;

/**
 * Created by habar on 26.10.2016.
 */
public class Admin extends User {
    @Override
    public boolean isModerator() {
        return false;
    }

    @Override
    public boolean isJUser() {
        return false;
    }

    @Override
    public boolean isAdmin() {
        return true;
    }
}
