package com.kl.staffmanagement.service;

import com.kl.staffmanagement.model.User;
import com.kl.staffmanagement.repos.UserRepos;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;


@Component(value = "userDetailService")
public class UserService implements UserDetailsService {

    private final UserRepos userRepos;

    public UserService(UserRepos userRepos) {
        this.userRepos = userRepos;
    }

    public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
        User user = userRepos.findByEmail(userEmail);
        if (user == null) {
            throw new UsernameNotFoundException("Invalid username or password.");
        }
        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), getAuthority());
    }

    private List getAuthority() {
        return Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"));
    }

    public List getUsers() {
        return this.userRepos.userList();
    }

}