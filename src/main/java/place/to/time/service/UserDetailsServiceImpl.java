package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;
import place.to.time.model.Role;
import place.to.time.model.User;
import place.to.time.repository.UserRepository;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by ENTITY on 2/5/2017.
 * Implementation of {@link org.springframework.security.core.userdetails.UserDetailsService} interface.
 */
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired()
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {

        User user = userRepository.findByLogin(login);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

        for(Role role: user.getRoles()){
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return new org.springframework.security.core.userdetails.User(user.getLogin(), user.getPassword(), grantedAuthorities);
    }
}
