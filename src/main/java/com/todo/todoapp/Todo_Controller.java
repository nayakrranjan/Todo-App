package com.todo.todoapp;

import jakarta.validation.Valid;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes("user")
public class Todo_Controller {
    private TodoRepository todoRepository;
    private String user;

    public Todo_Controller(TodoRepository todoRepository) {
        this.todoRepository = todoRepository;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String homePage (ModelMap modelMap) {
        modelMap.put("user", getUserName());
        // modelMap.addAttribute("todos", todoService.getByUser(getUserName()));
        List<Todo> todos = todoRepository.getByUserName(getUserName());
        modelMap.addAttribute("todos", todos);
        return "home";
    }

    @RequestMapping(value = "add-todo", method = RequestMethod.GET)
    public String todoPage (ModelMap modelMap) {
        Todo todo = new Todo(0, getUserName(), null, null, false);
        modelMap.put("todo", todo);
        return "todo";
    }
    @RequestMapping(value = "add-todo", method = RequestMethod.POST)
    public String redirectToHome (ModelMap modelMap, @Valid Todo todo, BindingResult result) {
        if (result.hasErrors())
            return "todo";
        // todoService.addTodo(getUserName(), todo.getTask(), todo.getTargetDate(), todo.isDone());
        todo.setUserName(getUserName());
        todoRepository.save(todo);
        return "redirect:/";
    }

    @RequestMapping("delete-todo")
    public String deleteTodo (@RequestParam int id) {
//        todoService.removeById(id);
        todoRepository.deleteById(id);
        return "redirect:/";
    }

    @RequestMapping(value = "update-todo", method = RequestMethod.GET)
    public String redirectToUpdate (@RequestParam int id, ModelMap modelMap) {
//        Todo todo = todoService.findById(id);
        Todo todo = todoRepository.findById(id).get();
        System.out.println(todo);
        modelMap.addAttribute(todo);
        return "todo";
    }

    @RequestMapping(value = "update-todo", method = RequestMethod.POST)
    public String updateTodo (ModelMap modelMap, @Valid Todo todo,
                              BindingResult result) {
        if (result.hasErrors())
            return "todo";

        todo.setUserName(getUserName());
        todoRepository.save(todo);
        return "redirect:/";
    }
    private String getUserName() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }
}
