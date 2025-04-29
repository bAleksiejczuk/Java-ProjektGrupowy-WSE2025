package com.example.baleksiejczuk;

public class User {
//    String name;
//    String surname;
//
//    String email;
    String login;
    String password;

//    public User(String name, String surname, String email , String login, String password ){
public User(String login, String password ){

//        this.name = name;
//        this.surname = surname;
//        this.email = email;
        this.login = login;
        this.password = password;
    }

//    public String getName(){
//        return name;
//    }
//
//    public String getSurname() {
//        return surname;
//    }
//
//    public String getEmail(){return email; }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }


}

