package com.example.baleksiejczuk;

public class LinkData {
    private String url;
    private String name;
    private boolean isPrivate;
    private String user;
    private String addedAt;
    private String addedTime;
    private String category;
    private int likes;

    public String getUrl() { return url; }
    public String getName() { return name; }
    public boolean isPrivate() { return isPrivate; }
    public String getUser() { return user; }
    public String getAddedAt() { return addedAt; }
    public String getAddedTime() { return addedTime; }
    public String getCategory() { return category; }
    public int getLikes() { return likes; }


    public void setUrl(String url) { this.url = url; }
    public void setName(String name) { this.name = name; }
    public void setPrivate(boolean isPrivate) { this.isPrivate = isPrivate; }
    public void setUser(String user) { this.user = user; }
    public void setAddedAt(String addedAt) { this.addedAt = addedAt; }
    public void setAddedTime(String addedTime) { this.addedTime = addedTime; }
    public void setCategory(String category) { this.category = category; }
    public void setLikes(int likes) { this.likes = likes; }


}
