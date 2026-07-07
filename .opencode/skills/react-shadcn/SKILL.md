---
name: react-shadcn
description: Use when building React UIs with shadcn/ui components. Covers installation, theming, component composition, accessibility, and Tailwind CSS. Trigger keywords: shadcn, shadcn/ui, Radix UI, Tailwind, React components, UI library, design system
---

# React + shadcn/ui Development

## Overview
shadcn/ui is a collection of beautifully designed, accessible React components. It's NOT an npm package — components are copied into your project as source code that you own and customize.

## Installation
```bash
# Initialize in your project
npx shadcn@latest init

# Add individual components
npx shadcn@latest add button
npx shadcn@latest add card dialog dropdown-menu
npx shadcn@latest add table form toast
```

## Architecture
```
components/
├── ui/              # shadcn/ui components (generated)
│   ├── button.tsx
│   ├── card.tsx
│   └── dialog.tsx
└── app/             # Your custom components
    ├── sidebar.tsx
    └── header.tsx
```

## Theming (CSS Variables)
```css
/* globals.css */
@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --primary: 222.2 47.4% 11.2%;
    --radius: 0.5rem;
  }
  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
  }
}
```

## Component Composition Pattern
shadcn/ui components use Radix UI primitives with a composition API:
```tsx
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
```

## Key Components
| Component | Use For |
|-----------|---------|
| Button | Actions, forms |
| Card | Grouped content |
| Dialog | Modals |
| DropdownMenu | Context menus, actions |
| Form | Forms with validation |
| Table | Data display |
| Tabs | Tabbed interfaces |
| Toast | Notifications |
| Sheet | Slide-out panels |

## Accessibility
- All shadcn/ui components are built on Radix UI which follows WAI-ARIA standards
- Keyboard navigation works out of the box
- Focus management in modals, dropdowns
- Screen reader announcements for dynamic content

## Tailwind CSS v4
- Use `@tailwind base; @tailwind components; @tailwind utilities;`
- CSS variables for theme colors (not Tailwind `dark:` classes when using shadcn)
- Responsive: `sm:`, `md:`, `lg:`, `xl:`, `2xl:`
- Custom values in `tailwind.config.ts`

## AI-Ready
shadcn/ui's open code pattern means AI models can read, understand, and generate new components. The consistent API (each component follows the same patterns) makes AI generation more reliable.
