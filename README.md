# Crossing Knowledge — Kids Educational Learning Platform

Digital Egypt Pioneers Initiative (DEPI) — Flutter Track

## Project & Team Information

| Field | Details |
|---|---|
| **Project Name** | Crossing Knowledge — Kids Educational Learning Platform |
| **Team Leader** | Ahmed Yasser |
| **Team Members** | Ahmed Yasser, Fares Mohamed, Abdelrahman Eliwa, Islam Ahmed, Ahmed Ali |
| **Supervisor** | Dr. Yousef Ahmed |
| **Track** | Flutter — Digital Egypt Pioneers Initiative (DEPI) |

## Overview

**Crossing Knowledge** is a mobile learning platform, built with Flutter, that connects parents with qualified teachers to organize and manage educational sessions for their children.

- Parents can search for teachers by subject, rating, and price.
- Parents can book tutoring sessions and track their child's learning progress.
- Teachers can manage their schedules, run lessons, and upload learning materials.
- An admin panel is used to manage users, monitor activity, and keep the platform running smoothly.

The goal of the platform is simple: make online learning easier, more organized, and more interactive for both parents and children.

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend (Mobile App) | Flutter |
| Backend | Node.js / Express |
| Database | PostgreSQL / MongoDB |
| Design | Figma |
| Version Control | Git & GitHub |
| API Testing | Postman |

## App Flow / Screens

### 1. Launch, Sign Up & Create Account
- **Launch screen** — shown while the app is loading, displaying the app logo.
- **Sign up screen** — users can create an account with email, or continue with Google, Apple, or Facebook.
- **Create account screen** — the user picks an account type (Parent or Teacher) and enters basic details.

### 2. Add Child & Set Learning Preferences
- **Add child screen** — the parent adds the child's name (up to 1 child on the free plan).
- **Choose goal screen** — the parent picks how much learning time is planned per day (Breeze, Casual, Regular, Focused, or Intense).
- **Choose activities screen** — the parent selects the type of activities to include in lessons, such as storytelling, alphabet games, or counting games.

### 3. Home & Lessons
- **Account created screen** — a welcome message confirms the account was set up successfully.
- **Home screen** — shows an overview of lessons in progress, completed lessons, categories, and achievements.
- **Lessons screen** — lists all of the child's lessons with status (active or completed), instructor name, date, and duration.

### 4. Schedule & Messaging
- **Schedule screen** — the parent searches for a suitable teacher and can view their rating and hourly rate.
- **Inbox screen** — shows conversations with the teachers the parent has scheduled lessons with.
- **Chat screen** — parent and teacher can message each other, and booking confirmations appear directly in the chat.

### 5. Teacher Onboarding
- **Create account screen** — the same sign up flow, with the account type switched to Teacher.
- **Account details screen** — the teacher uploads a photo and fills in country, hourly rate, and a short bio.
- **Schedule setup screen** — the teacher sets lesson duration and location type (Virtual or In-Person).

### 6. Teacher Working Hours
- **Working hours screen** — the teacher turns on the days they are available each week.
- **Time picker screen** — the teacher sets the exact start and end time for a selected day.
- **Confirmation screen** — a pop-up confirms that the working hours were updated successfully.

### 7. Teacher Dashboard
- **Welcome screen** — shown right after the teacher's account is created.
- **Home screen** — gives the teacher an overview of completed and scheduled lessons for today and the coming days.
- **Inbox screen** — shows messages from parents about their scheduled lessons.
- **Profile screen** — displays the teacher's rating, bio, completed lessons, and the session lengths parents can book.

### 8. Shop, Profile & Settings
- **Shop screen** — parents can upgrade to a Pro plan or unlock extra teachers and lesson categories.
- **Profile screen** — shows the parent's personal details, subscription plan, and their children's information.
- **Settings screen** — lets users manage notifications, app appearance (light, dark, or system), and language.

### 9. Booking a Lesson
- **Teacher profile screen** — the parent reviews the teacher's info and picks a session length to book.
- **Select date screen** — a calendar lets the parent choose the lesson date.
- **Confirm booking screen** — shows a summary of the lesson duration, date, child, category, and payment method.
- **Booking confirmed screen** — a success message confirms the lesson has been booked.

## Conclusion

Crossing Knowledge brings parents, children, and teachers together in one simple mobile app, built with Flutter. Parents can find the right teacher, book lessons, and follow their child's progress, while teachers can manage their schedule and connect with families with ease. This documentation walks through the main screens of the app, from sign up to booking a lesson, showing how each part of the platform works together to make online learning simple and organized.
