# qb-lootcar Lootable Props System with Ox_Target Integration

## Overview

This resource provides a lootable props system for GTA V using the `ox_target` integration. Players can interact with predefined props to search for loot, with animations, notifications, and inventory integration.

---

## Features
- Integration with **ox_target** for prop interaction.
- **ox_inventory** compatibility for managing loot.
- Configurable loot table and props.
- Visual progress bar and animations during loot search.
- Server-side validation for looting actions.

---

## Requirements

This resource depends on the following:
- **ox_target**
- **ox_lib**
- **ox_inventory**
- **qb-core**

Ensure these are installed and properly configured before using this resource.

---

## Installation

1. **Download and Extract**  
   Download the resource and place it in your `resources` folder.

2. **Add to Server Config**  
   Add the following line to your `server.cfg`:
   ```plaintext
   ensure qb-lootcar
   ```

3. **Dependencies**  
   Ensure the required dependencies (`ox_target`, `ox_lib`, `ox_inventory`, `qb-core`) are properly installed and loaded in your server.

---

## Configuration

Edit the `config.lua` file to set up:
- **Lootable Props**: Define which props can be looted.
- **Loot Table**: Customize the items players can find and their probabilities.
- **Loot Cooldown**: (Optional) Set cooldown periods for props.

---

## Usage

1. **Interacting with Props**  
   Players can approach a predefined prop and interact with it via the `ox_target` prompt.

2. **Searching for Loot**  
   A progress bar will display during the search. If successful, players will receive loot, which is added to their inventory.

3. **Notifications**  
   Players receive feedback through notifications:
   - Success: When loot is obtained.
   - Failure: When inventory is full.
   - Info: When no loot is found.

---

## Development Notes

- **Debugging**: Debug messages are enabled to help monitor script behavior. These can be disabled or removed for production.
- **Cooldown**: The loot cooldown system is currently disabled for testing. Enable it in `config.lua` if required.
- **Custom Animations**: Animations are configurable in the progress bar setup.

---

## Future Enhancements

- Add localized notifications for multi-language support.
- Implement a dynamic cooldown system based on server population.
- Extend lootable props to include vehicles and other entity types.

---

## Credits

- **Author**: Mundstock
- **Version**: 1.0.0
- **Description**: Lootable props system with `ox_target` integration.

---

## Support

For support or issues, please contact the author or refer to the documentation of the dependencies.

---
