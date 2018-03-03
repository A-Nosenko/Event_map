package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import place.to.time.repository.UserRoleRepository;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleRepository userRoleRepository;

    @Override
    @Transactional
    public void ban(long id) {
        userRoleRepository.ban((int) id);
    }

    @Override
    @Transactional
    public void unBan(long id) {
        userRoleRepository.unBan((int) id);
    }
}
