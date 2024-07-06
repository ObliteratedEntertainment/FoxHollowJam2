# Table of Contents

<div id="user-content-toc">
  <ul>
    <li><a href="#introduction">1. Introduction</a>
      <ul>
        <li><a href="#summary">1.1. Summary</a></li>
        <li><a href="#inspirations">1.2. Inspirations </a></li>
        <li><a href="#player-experience">1.3. Player Experience</a></li>
        <li><a href="#genre">1.4. Genre</a></li>
        <li><a href="#game-theme">1.5. Theme</a></li>
        <li><a href="#target-audience">1.6. Target Audience</a></li>
        <li><a href="#platform">1.7. Platform</a></li>
        <li><a href="#development-software">1.8. Development Software</a></li>
      </ul>
    </li>
    <li><a href="#gameplay">2. Gameplay</a>
      <ul>
        <li><a href="#core-loop">2.1. Core Loop</a></li>
        <li><a href="#mechanics">2.2. Mechanics</a>
          <ul>
            <li><a href="#primary">2.2.1. Primary</a></li>
            <li><a href="#secondary">2.2.2. Secondary</a></li>
            <li><a href="#tertiary">2.2.3. Tertiary</a></li>
            <li><a href="#special-callouts">2.2.4. Special Callouts</a></li>
          </ul>
        </li>
        <li><a href="#systems">2.4. Systems</a>
          <ul>
            <li><a href="#flows">2.4.1. Flows</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li><a href="#art">3. Art</a>
      <ul>
        <li><a href="#art-style">3.1. Art Style</a></li>
        <li><a href="#style-inspiration">3.1. Style Inspiration</a></li>
      </ul>
    </li>
    <li><a href="#audio">4. Audio</a>
      <ul>
        <li><a href="#audio-style">4.1. Audio Style</a></li>
        <li><a href="#music">4.2. Music</a></li>
        <li><a href="#sound-effects">4.3. Sound Effects</a></li>
        <li><a href="#voice-overs">4.4. Voice Overs</a></li>
      </ul>
    </li>
    <li><a href="#ui">5. UI</a>
      <ul>
        <li><a href="#ui-style">5.1. UI Style</a></li>
      </ul>
    </li>
    <li><a href="#ui">6. Brainstorms</a>
    </li>
  </ul>
</div>

---

# Introduction

Game concept originates from the FoxHollowGames Jam 2 where a design constraint and theme were enforced.
The design constraint must abide by the principle of [Input Randomness](https://youtu.be/dwI5b-wRLic)
The theme of the game must be **Primordial**.

Base Game Design Document was sourced from [here](https://docs.google.com/document/d/15JQBeHyr4N1aE6RaocpAiNsLSeXEk513r5pk_1ekVA0/edit#heading=h.ya8m2ckxnfjz).

## Summary

Primitive civilization simulator where the player has a god-like influence on the world's inhabitants using action cards drawn from a randomized deck.
Guide the infancy of humanity through to the next age by gathering enough resources, growing your population, and eventually electing a leader to found your civilization.

## Inspirations

Simmiland - https://store.steampowered.com/app/932850/Simmiland/
* Key Takeaway: Villager's automatically perform actions according to their internal desires/wishes. Player can influence the game with cards bought using the villager's worship points.
* Card Ideas: Create/grow resources in the world, Create villagers, generate disasters

Reus - https://store.steampowered.com/app/222730/Reus/
* Key Takeaway: Player controls four gods that have special abilities. The god's abilities help improve/cultivate the areas so the villagers can grow their dedicated civilizations. Required resources are very simple: food/science/minerals.

## Player Experience

The key point for players will be the feeling of struggle of an early civilization that is barely able to survive due to limited food or other resources.
Drawing more rare/impactful cards should provide relief to the player as they can grow their civlization or overcome the current challenges they are facing.
The player should feel attachment to each new villager added to their civlization and grow to know the pros/cons of each villager.
The loss of any villager due to starvation/predators should be very impactful and the player will need to seriously evaluate how to continue to survive.

## Genre

God Game, Strategy, Simulation, Card Game

## Game Theme

Set in a prehistoric context where the cradle of humanity is just beginning to develop and will have themes of hunter/gatherer survival and indirect management of the civilization's development through risk/reward card usage.

## Target Audience

The primary audience for this game enjoy god-like simulation games with indirect, but profound interactions on the game environment to sculpt a world they are interested in.

**Demographics**: Late teens to adult

**Min-maxer**: Enjoys deeply considering the impacts of card plays/placements and getting the most value out of every action

## Platform

* Web
* Windows
* Linux
* Mac

## Development Software

* Godot 4.3 beta2
* Aseprite
* 1BitDragon


# Gameplay

## Core Loop

Draw a set of cards -> Play a card -> Gather more resources to buy more card draws

## Mechanics
### Primary

The primary game mechanic is the usage of action cards that enable the player to assist their civlization in growing or overcoming some hurdles it may be encountering.

* The player's hand will always be limited to X cards and will auto draw a new random card when the player uses a card
* Cards will be categorized into different types (resources, technology, divine intervention)
* Cards will also rarity classes that have different levels of impact
* Cards may require the consumption of resources

### Secondary

When a new villager is born into the world, the player has a chance to roll their stats and allocate which stat rolls applies to the villager's skills.
This will can require more indepth optimization by the player to cover weaknesses of the current set of villagers they have.

### Tertiary

Limiting scope due to short timespan for 3 day gauntlet. 
In a more expanded game setting, this could potentially include some form of villager religion system with tributes to the player for spending as resources.
If the player does things that the villagers like, the villagers would give more gifts to the god-like player.

### Special Callouts



## Systems

* Villager AI
  * Internal stats/skill proficiencies determining their success rate or speed at certain actions
  * Resource consumption, require certain amount of food/water to continue to perform optimally
  * Death if lack of resources for an extended period of time or critical damage from wildlife

* Resources
  * Different resources exist within the world naturally or placed through player resource cards
  * Can be harvested by villagers once discovered
  * Expended by villagers to create things they view as priorities (or influenced priorities through player cards)

* Procedural Generation
  * World layout is procedurally generated for each game
  * Simple biomes: Forest, grasslands, water 

* Time
  *  

# Art

## Art Style

The art style will be eagle-eye/godview top-down pixel graphics.
Villagers and the world should be simplified, but gritty to have a more tense survival feel.
Cards artwork should be simple, but impactful iconography to indicate what the card does without needing to necessarily read the card text.

## Style Inspiration

* Superbrothers: Sword & Sworcery EP: The saturated world and the stick-like character design.
* Simmiland: Very zoomed out view of the world. Simple, but effective terrain tilemaps to make procgen of world simpler.

# Audio

## Audio Style

* SFX should be crisp and distinct so the player can immediately understand certain actions are happening without having to look
* SFX should be direction based on the player's center of screen
* Music should be moody, but not too depressing. Should create a feeling of optimistic struggle

## Music

* Optimistic, but slow to simulate the feeling of the adversity the villagers face, but the positive influence the player can have

## Sound Effects

* Villager actions: walking, gathering berries, chopping wood, fighting/throwing spears, happy, sad, hungry, talking
* Card play: Simple happy jingle on card play. Hovering on a card plays a snappy paper shuffle sound. Drawing cards plays a paper shuffle sound

## Voice Overs

Peanuts/Snoopy style adults speaking. Very muffled nonsensical speak, but enough to give some hint that it is heavily stylized communication

# UI

## UI Style

The UI will be split into the overlay where all of the player's cards will be present as well as the villager creation screen (when relevant).

All other UI will be in-world using simple emoticons that will appear over villagers when they decide to perform certain actions or their internal state changes.
