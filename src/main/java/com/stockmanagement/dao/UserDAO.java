package com.stockmanagement.dao;

import com.stockmanagement.model.User;

import java.io.*;
import java.util.*;

public class UserDAO {
    private static final String FILE_PATH = "src/main/webapp/WEB-INF/users.txt"; // Update this with the actual file path

    // Get all users from the file
    public static List<User> getAllUsers() throws IOException {
        List<User> users = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) {
            file.createNewFile(); // Create file if it doesn't exist
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    users.add(new User(parts[0], parts[1], parts[2]));
                }
            }
        }
        return users;
    }

    // Save a new user (append mode)
    public static void saveUser(User user) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(user.getUsername() + "," + user.getPassword() + "," + user.getRole());
            bw.newLine();
        }
    }

    // Update an existing user's details
    public static void updateUser(User updatedUser) throws IOException {
        List<User> users = getAllUsers();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users) {
                if (user.getUsername().equals(updatedUser.getUsername())) {
                    bw.write(updatedUser.getUsername() + "," + updatedUser.getPassword() + "," + updatedUser.getRole());
                } else {
                    bw.write(user.getUsername() + "," + user.getPassword() + "," + user.getRole());
                }
                bw.newLine();
            }
        }
    }

    // Delete a user by username
    public static void deleteUser(String username) throws IOException {
        List<User> users = getAllUsers();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users) {
                if (!user.getUsername().equals(username)) {
                    bw.write(user.getUsername() + "," + user.getPassword() + "," + user.getRole());
                    bw.newLine();
                }
            }
        }
    }

    // Get a single user by username
    public static User getUser(String username) throws IOException {
        for (User user : getAllUsers()) {
            if (user.getUsername().equals(username)) {
                return user;
            }
        }
        return null;
    }
}
