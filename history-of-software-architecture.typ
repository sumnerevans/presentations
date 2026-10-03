#import "@preview/touying:0.8.0": *
#import themes.metropolis: *

#set text(font: "Iosevka")

#show: metropolis-theme.with(
  aspect-ratio: "4-3",
  footer: self => self.info.institution,
  config-info(
    title: [Software Architecture from First Principles],
    author: [Sumner Evans],
    date: datetime(year: 2026, month: 10, day: 06),
    institution: [Senior Implementation Tech Lead Can/Am Technologies],
  ),
  config-common(show-notes-on-second-screen: right),
)

#let image-slide(body, background: none, fit: "cover") = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      background: background,
      margin: 2em,
    ),
  )
  set text(fill: self.colors.neutral-lightest, size: 2em)
  set image(width: 100%, height: 100%, fit: fit)
  touying-slide(self: self, align(horizon + center, body))
})

#title-slide()

#speaker-note[
  This is an interactive talk:

  - ask questions throughout
  - I'm also going to ask you to participate in the discussion

  This way you have to do the work during this talk instead of me :)
]

= What is Software Architecture?

#speaker-note[
  Let's start with some of your thoughts: what comes to mind when you think of
  "software architecture"?

  Maybe start with architecture terms that you have heard?
]

#align(center)[
  Software Architecture is the discipline of reasoning and making decisions
  about the _properties_ and _interactions_ of the _elements_ which compose a
  software system.

  #box(width: 90%)[
    #image("acm-scaling-architecture/images/architectural-blueprint.jpg")
  ]
]

#speaker-note[
  Software Architecture is a metaphor for actual Architecture.

  Architects have to think about the properties of the various elements of a
  building. For example, you don't want to put an indoor outlet outdoors, or
  use uncovered drywall outside.

  Architects think about the interaction between those elements. For example,
  making sure the plumbing, electrical, HVAC, etc. don't run across each other.

  Architects have to make lots of decisions about things like what materials to
  use and order of installation.
]

== Reasoning Tools

#speaker-note[
  So we have to reason and make decisions about our systems, how do we do that?

  The two most important things to think about when reasoning about software
  architecture are:
]

Architecting Software Requires thinking about _trade-offs_ and _constraints_ in
relation to the _desired properties_ of a system.

= Desired Properties

#speaker-note[
  There are lots of _desirable properties_ of software systems. So here's
  another question: what are some potentially desirable properties of software
  systems?
]

- Satisfies the business requirements
- User interactions are fast
- Doesn't cost much to run
- Is secure
- Uses technologies that you can hire for
- Is easy to modify
- Guaranteed to be correct
- Resilient to cyber attacks
- Takes advantage of the latest hardware advances
- Works well on old hardware

#speaker-note[
  Here are some that I thought of...

  Some people say the "architecture" is only concerned with the meta-analysis
  of the system, whereas "design" is where the requirements come into play.

  I think that's a load of bullshit. In order to talk in an educated manner
  about why we choose a particular architecture, we have to understand the
  requirements of the system.
]

= Constraints

- Easy to organise a large company of workers towards building features
- Memory
- Money
- Low power draw (plutonium power source)
- Fault tolerant even under the solar radiation bombardment
- Speed of light
- No outside code allowed
- Airgap

= Trade-offs

- Sometimes the constraints are at odds with one another
- Sometimes the desired properties are at odds with one another
- Sometimes the properties are at odds with the constraints

The end result is the same: we have to make a trade-off decision.

= Tools

What tools do we have to build systems which accomplish the goals given the
constraints?

== Separation of Concerns

- MVC
- Microservices
- Event Driven Architecture
- Pipelining
- Layering

== Liskov Substitution Principle

= Conway's Law

Conway

== If You Can Name It, You Can Build It

= Exercise

#image-slide(background: image("resources/netflix.jpg"))[]

#speaker-note[
  OK, so let's look at a couple examples, starting with Netflix.

  What properties do you think Netflix felt were desirable when they were
  architecting their system?

  - Fast to get to viewing video
  - Viewing is not interrupted by buffering
  - Interactions are fast with the app
  - Fast on lots of devices
  - Consistently fast worldwide
  - Many simultaneous users
  - Easy to quickly modify and deploy new features
]

What is the right architecture?

It is dependent on context.

An architectural decision is only good or bad in the context of the time in which it was made

Architecture needs to change
based on circumstance

== Additional Resources

Not necessarily software architecture related

Sean Geodecke
SWE Radio
Coder
Peterman

// software engineering from first principles
//
// * Separation of Concerns
//
//   * responsibility allocation
//   * unix philosophy
//
//   * Liskov substitution principle
//
// * Trade-Offs
//
// * functions
// * classes/structs/interfaces
// * modules/packages/libraries
// * (micro)services
// * systems/protocols
//
// * pipeline architecture
// * frontend/backend
// * business area
//
// Exercise
//
// * Tradeoffs
//
// * Services
//
// * Naming
//
// * Conway's Law
