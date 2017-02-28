package cn.mrx.dto;

import java.util.List;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import cn.mrx.controller.validation.ValidGroup1;
import cn.mrx.controller.validation.ValidGroup2;

public class User {
    private Integer id;

    @NotEmpty(message="用户名不能为空！", groups={ValidGroup1.class, ValidGroup2.class})
    private String username;

    @NotEmpty(message="密码不能为空！", groups={ValidGroup1.class, ValidGroup2.class})
    private String password;

    @NotEmpty(message="图片不能为空！")
    private String img;

    @NotEmpty(message="邮箱不能为空！", groups={ValidGroup1.class})
    @Email(message="邮箱格式不正确！", groups={ValidGroup1.class})
    private String email;

    private Integer role;

    private Integer active;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(Integer active) {
        this.active = active;
    }
}