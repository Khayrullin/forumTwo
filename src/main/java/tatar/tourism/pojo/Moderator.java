package tatar.tourism.pojo;

/**
 * Created by habar on 26.10.2016.
 */
public class Moderator extends  User {
    @Override
    public boolean isModerator() {
        return true;
    }

    @Override
    public boolean isJUser() {
        return false;
    }

    @Override
    public boolean isAdmin() {
        return false;
    }
}
