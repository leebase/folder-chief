# Getting Help & Support

> **Self-serve first, community always, specialized help when you want it.**

Whether you are configuring your first project note, troubleshooting CLI permissions, or exploring custom workflows for your business, here is how to get help with Folder Chief.

---

## Tier 1: Ask Your Chief

Your Chief has built-in access to the entire product documentation:

- Simply ask your Chief questions like:
  - *"How does memory correction work?"*
  - *"How do I set up my first specialist workspace?"*
  - *"Can you explain the security boundaries?"*
  - *"How do I back up my personal notes?"*
- Your Chief will read from its internal manual (`chief/manual/`) and answer accurately.

---

## Tier 2: Community & Self-Serve Support

### Common Troubleshooting Scenarios

1. **Permission Denied / Write Errors:**
   - Ensure you have write permissions to the directory: `chmod -R u+rw .`
   - Ensure your AI CLI is authorized to edit files in the working directory.
2. **Interrupted Onboarding:**
   - Inspect what the interrupted attempt created. Remove only its partial onboarding files; make sure `chief/installed.md` is absent, then restart. Do not delete pre-existing owner notes or state.
3. **Verifying Instructions Loaded:**
   - Ask your Chief: *"What are your 8 operating rules?"*
   - If it recites the rules from `AGENTS.md`, your instructions are loaded correctly.

### GitHub Discussions & Issues
- **Questions & Ideas:** Join [GitHub Discussions](https://github.com/leebase/folder-chief/discussions) to share setups, ask questions, and see how others use Folder Chief.
- **Bug Reports:** If you discover an issue or unexpected behavior in the product files, open an issue on [GitHub Issues](https://github.com/leebase/folder-chief/issues).

---

## Tier 3: LeeBase AI Concierge (Human Service Layer)

Folder Chief is 100% free, open-source, and fully self-serve. Everything needed to run a powerful personal chief of staff is included in this repository.

However, some professionals and business owners prefer hands-on assistance setting up their Chief around their specific organization, designing bespoke multi-specialist teams, or integrating with proprietary enterprise systems.

**LeeBase AI Concierge** is the professional service layer provided by LeeBase Consulting:

- **When to consider AI Concierge:**
  - Setting up customized Chief of Staff systems for specific industries (law firms, medical practices, investment funds, agencies).
  - Designing multi-workspace specialist architectures for executive teams.
  - Multi-user deployments with enterprise governance and audit requirements.
  - Custom system integrations and production workflow implementations.
- **Contact & Inquiries:** See [`chief/manual/about-leebase.md`](../chief/manual/about-leebase.md) or email <lee@leebase.com>.
