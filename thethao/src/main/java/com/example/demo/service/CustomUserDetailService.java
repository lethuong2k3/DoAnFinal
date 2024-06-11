package com.example.demo.service;

import com.example.demo.entity.NguoiDung;
import com.example.demo.model.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashSet;


@Service
public class CustomUserDetailService implements UserDetailsService {
    @Autowired
    private NguoiDungService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        NguoiDung users = userService.findByTaiKhoan(username);
        if (users == null) {
            throw new UsernameNotFoundException("Sai tài khoản hoặc mật khẩu");
        }
        Collection<GrantedAuthority> grantedAuthoritySet = new HashSet<>();
        grantedAuthoritySet.add(new SimpleGrantedAuthority(users.getVaiTro()));
        return new CustomUserDetails(users, grantedAuthoritySet);
    }


}
