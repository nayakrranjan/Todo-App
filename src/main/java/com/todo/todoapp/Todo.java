package com.todo.todoapp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.FutureOrPresent;

import java.time.LocalDate;

@Entity(name = "todos")
public class Todo {

    @Id
    @GeneratedValue
    private int id;

    private String userName;

    @Column(name = "task")
    private String task;

    @Column(name = "target_date")
    @FutureOrPresent
    private LocalDate targetDate;

    @Column(name = "done")
    private boolean done;

    public Todo(int id, String userName, String task, LocalDate targetDate, boolean done) {
        this.id = id;
        this.userName = userName;
        this.task = task;
        this.targetDate = targetDate;
        this.done = done;
    }

    public Todo() {

    }

    @Override
    public String toString() {
        return "Todo{" +
                "id=" + id +
                ", user=" + userName +
                ", task='" + task + '\'' +
                ", targetDate=" + targetDate +
                ", done=" + done +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String user) {
        this.userName = user;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public LocalDate getTargetDate() {
        return targetDate;
    }

    public void setTargetDate(LocalDate targetDate) {
        this.targetDate = targetDate;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }
}
