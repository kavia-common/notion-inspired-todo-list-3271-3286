# Developer Guide: Notion-Inspired React Todo App

## Overview

This project is a minimalist, frontend-only Todo application inspired by Notion. Users can add, edit, delete, and reorder their todo items using an intuitive drag-and-drop interface. The focus is on a clean, modern UI with a single-column layout, closely mimicking Notion's style. **No backend or database is required**—all state is managed in-browser.

---

## Tech Stack

- **Framework**: [React](https://reactjs.org/) (Functional components and Hooks)
- **Styling**: Custom CSS, following the KAVIA style guide
- **Drag-and-Drop**: Native HTML5 drag-and-drop or a lightweight library (if used, see `package.json`)
- **State Management**: React local state (with `useState` / `useReducer`)
- **Testing**: React Testing Library, Jest (if configured in `package.json`)
- **Build Tools**: [Create React App](https://create-react-app.dev/) conventions
  
---

## Project Structure

```
frontend/
├── README.md
├── DEVELOPER_GUIDE.md      # (this document)
├── package.json
├── public/
│   └── index.html
├── src/
│   ├── App.js              # Main app component, entry point
│   ├── App.css             # Main app and theme styling
│   ├── index.js            # App bootstrap
│   ├── index.css           # Global styles and CSS variables
│   ├── components/         # (If exists) Reusable UI components
│   └── ...                 # Additional modules as needed
└── ...
```

- **App.js** contains the root logic and typically manages the todo list and theme toggling.
- **App.css** and **index.css** define visual appearance, brand colors, and responsive layout.
- All logic is self-contained; there are _no API calls or backend services_.

---

## Local Development Setup

### 1. Prerequisites

- [Node.js](https://nodejs.org/) (v16 or above recommended)
- [npm](https://docs.npmjs.com/) (comes with Node.js)

### 2. Install Dependencies

```sh
npm install
```

### 3. Running the App Locally

```sh
npm start
```
By default, app launches at [http://localhost:3000](http://localhost:3000).

### 4. Environment Variables

Although this frontend app does not require API keys or secrets, it supports standard `.env` overrides for Create React App, including:

- `REACT_APP_API_BASE`
- `REACT_APP_BACKEND_URL`
- `REACT_APP_FRONTEND_URL`
- `REACT_APP_WS_URL`
- `REACT_APP_NODE_ENV`
- `REACT_APP_NEXT_TELEMETRY_DISABLED`
- `REACT_APP_ENABLE_SOURCE_MAPS`
- `REACT_APP_PORT`
- `REACT_APP_TRUST_PROXY`
- `REACT_APP_LOG_LEVEL`
- `REACT_APP_HEALTHCHECK_PATH`
- `REACT_APP_FEATURE_FLAGS`
- `REACT_APP_EXPERIMENTS_ENABLED`

> _None of these are required for local operation; they're present for compatibility or future extension._

---

## Core Features

- **Add Todo**: Enter task details; new items appear at the top/bottom.
- **Edit Todo**: Inline or modal editing for todo text; changes saved instantly.
- **Delete Todo**: Remove tasks with a trash/delete action (button or icon).
- **Drag-and-Drop Reordering**: Rearrange todos by dragging each card; order persists in local state.
- **Theme Toggle**: Light/dark mode switch, with accessible aria labels.
- **Persistence** *(optional)*: If coded, todos may be saved to `localStorage`.

---

## State Management

- **Approach**: Uses React built-in hooks (`useState`, optionally `useReducer` if the logic is more complex).
- **Scope**: All state (list of todos, current editing item, UI state) is managed in the root or context/local state.
- **No Redux or Context API**: Unless the codebase introduces it, global state libraries are intentionally avoided for simplicity.

---

## Styling & Theme (per Style Guide)

The app follows a **modern, clean, minimal style**, aligned with the KAVIA brand:

- **Primary Color:** `#3b82f6`
- **Secondary Color:** `#64748b`
- **Success Accent:** `#06b6d4`
- **Error Accent:** `#EF4444`
- **Background:** `#f9fafb`
- **Surface:** `#ffffff`
- **Text:** `#111827`

### Layout

- **Single Central Column**: The todo list and header are centered and responsive.
- **Header**: App title, possibly with theme toggle button at top right.
- **Todo Item as Card**: Each todo displays on a card/row, with edit, delete, and drag handles on the right.

### Customization

CSS variables for main brand colors are defined, typically in `src/App.css` or `src/index.css`:

```css
:root {
  --kavia-orange: #E87A41;
  --kavia-dark: #1A1A1A;
  --text-color: #111827;
  --text-secondary: #64748b;
  --border-color: rgba(100, 116, 139, 0.1);
  --primary: #3b82f6;
  --secondary: #64748b;
  --success: #06b6d4;
  --error: #EF4444;
  --background: #f9fafb;
  --surface: #fff;
}
```

---

## Accessibility & UX Conventions

- **Keyboard Accessible**: Tab navigation for add/edit/delete buttons; drag-and-drop fallback (if needed).
- **Aria Labels**: All interactive elements (e.g., theme toggle, add, edit, delete, drag handles) have descriptive `aria-label`.
- **Responsive**: Scales for desktop and mobile viewports.
- **Focus Styles**: Visible when tabbing; use brand highlight or high-contrast outline.
- **High Contrast**: Sufficient color contrast for text and actions.
- **Minimal Animations**: Motions for add/remove/reorder are subtle and non-distracting.

---

## Testing

- **Unit Tests**: If available (`App.test.js`), run with:
  ```sh
  npm test
  ```
  This launches React Testing Library's interactive watch mode.
- **Test Coverage**: Focus on core behaviors—adding, editing, deleting, drag-and-drop—and accessibility.
- **End-to-End testing**: Not included by default.

---

## Build & Deployment

- **Build Command (Production):**
  ```sh
  npm run build
  ```
  Outputs static files to the `build/` directory, ready for static hosting such as Vercel, Netlify, or GitHub Pages.
- **No Backend Required**: Deploy the static build to any CDN or static site host.

---

## Contribution Guidelines

1. **Fork/Clone** the repository before making changes.
2. **Branch**: Create a feature or fix branch for proposed changes (`feature/xyz`, `fix/bug`)
3. **Code Style**: Follow modern JS, React, and the [Airbnb style guide](https://github.com/airbnb/javascript) where reasonable.
4. **Styling**: Use CSS variables defined in `App.css`/`index.css`. Avoid adding new colors or fonts unless maintaining theme.
5. **Accessibility**: Ensure new UI components remain keyboard-accessible and screen reader friendly.
6. **Testing**: Add/modify tests for new features or bug fixes.
7. **PR Review**: Submit a pull request with a description of your changes. Reference related issue(s) if any.
8. **Documentation**: Update this guide and user-facing docs as the codebase evolves.

---

## Further Notes

- This codebase uses only a minimal set of dependencies. Prefer not to add state or UI frameworks unless absolutely required.
- See `README.md` for a user-facing summary and [Create React App documentation](https://create-react-app.dev/docs/getting-started/) for advanced customization.
- For any questions about architecture, theming, or extensibility, review the code comments in `App.js` and refer to this guide.

---

**Welcome to the team, and happy hacking!**

---

### Sources

- `notion-inspired-todo-list-3271-3286/frontend/README.md`
- `notion-inspired-todo-list-3271-3286/frontend/src/App.js`
- Style guide from work item (`#3b82f6` etc.)
- List of relevant `.env` environment variables

