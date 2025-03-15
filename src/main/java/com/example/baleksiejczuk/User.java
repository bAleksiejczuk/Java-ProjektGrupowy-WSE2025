package com.example.baleksiejczuk;

public class User {
    String name;
    String surname;
    String login;
    String password;

    public User(String name, String surname, String login, String password ){
        this.name = name;
        this.surname = surname;
        this.login = login;
        this.password = password;
    }

    public String getName(){
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }


}

