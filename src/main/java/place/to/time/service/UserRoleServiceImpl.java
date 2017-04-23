package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import place.to.time.repository.UserRoleRepository;

/**
 * Created by ENTITY on 4/23/2017.
 */
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleRepository userRoleRepository;

    @Override
    @Transactional
    public void ban(long id) {
    userRoleRepository.ban((int)id);
    }

    @Override
    @Transactional
    public void unBan(long id) {
    userRoleRepository.unBan((int)id);
    }
}
