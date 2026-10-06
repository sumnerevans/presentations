#import "@preview/touying:0.8.0": *
#import themes.metropolis: *

#set text(font: "Iosevka")
#set quote(block: true)

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

  _AUDIENCE PARTICIPATION_
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

  _READ SLIDE_

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

  _READ SLIDE_
]

Architecting software requires thinking about _trade-offs_ and _constraints_ in
relation to the _desired properties_ of a system.

= Desired Properties

#speaker-note[
  There are lots of _desirable properties_ of software systems. So here's
  another question: what are some potentially desirable properties of software
  systems?

  _AUDIENCE PARTICIPATION_
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
- Fault tolerant even under the solar radiation bombardment

#speaker-note[
  Here are some that I thought of...

  _READ SLIDE_

  _Some people say the "architecture" is only concerned with the meta-analysis
  of the system, whereas "design" is where the requirements come into play._

  _I think that's a load of bullshit. In order to talk in an educated manner
  about why we choose a particular architecture, we have to understand the
  requirements of the system._
]

= Constraints

#speaker-note[
  Unfortunately, we have to build software in the real world, which means that
  we have to deal with constraints.

  So here's the next question: what are some potential constraints that we may
  face when building software systems?

  _AUDIENCE PARTICIPATION_
]

- Money
- Development Time
  - Easy to organise a large company of workers towards building features
- Available development resources
- Regulations
  - Code need to be written in an airgapped environment (no libraries, no internet)
- Compute Resources (disk, RAM, CPU, cache, GPUs, network switches)
- Small amounts of available power (ex: plutonium power source)
- The speed of light

#speaker-note[
  Here are some that I thought of...

  _READ SLIDE_
]

= Trade-offs

#speaker-note[
  So every software has a set of desirable properties and a set of constraints.

  _READ SLIDE_
]

- Sometimes the desired properties are at odds with one another
- Sometimes the constraints are at odds with one another
- Sometimes the properties are at odds with the constraints

#pause

The end result is the same: we have to make a decision about *what trade-off to
make*.

= Conceptual Frameworks

#speaker-note[
  So how do we reason about the trade-offs? Luckily, we have over 50 years of
  software engineering practice evolution to learn from.

  There have been a lot of "conceptual frameworks" that have been used to solve
  real software architecture problems across many different domains.

  Similar patterns emerge to solve problems across different levels of
  abstraction

  These frameworks help us reason about the trade-offs systematically.
]

- Separation of Concerns
- Interfaces

#speaker-note[
  I'm going to cover two fundamental frameworks because these are the ones that
  resonate the most with me.

  _READ SLIDE_

  Whenever I'm thinking about the architecture of a software system I think
  about these two frameworks first.

  As we go through each of them, we are going to investigate how each of them is
  applied in various contexts, up and down the abstraction hierarchy.
]

== Separation of Concerns

Separation of Concerns says that a complex software system should be divided
into distinct _concerns_ that can be individually reasoned about.

#speaker-note[_READ SLIDE_]

#pause

#speaker-note[
  There are lots of ways to slice a system into concerns. Here are some broad
  categories of ways to slice:

  _READ SLIDE_
]

- *Temporally* - slicing the software by the sequencing of activities
- *Workload* - slicing the software by the properties of the compute workloads
- *Spacially* - slicing the software by the physical or logical location of the
  compute activities
- *Feature* - slicing the software based on the features of the system

#speaker-note[
  We are going to look at how each of these slicing strategies is applied at
  different levels of abstraction:

  - Hardware
  - Programming Language
  - Module
  - Service or Microservice
]

== Separation of Concerns: Temporal Slicing

#speaker-note[
  Let's start with temporal slicing.

  What are some places you have seen the sequencing of activities be a dividing
  line for a software system?

  _AUDIENCE PARTICIPATION_
]

Slicing the software by the sequencing of activities

#pause

#speaker-note[
  At each of these levels of abstraction, using temporal slicing is a trade-off.

  - Hardware: FPGA/ASIC
  - PL: FP normally sacrifices cache locality
]

- Hardware Level
  - CPU Pipelining
  - Sequential execution of instructions
- Programming Language Level
  - Functional programming data processing pipelines (streams, LINQ)
- Module Level
  - Data processing pipelines (streams)
  - Extract, Transform, Load (ETL)
  - Event-driven architecture
- Service Level
  - #link("https://flink.apache.org/")[Apache Flink],
    Apache Kafka (streaming data processing pipelines)
  - Apache Airflow, AWS Glue (ETL pipelines)

== Separation of Concerns: Workload Slicing

#speaker-note[
  Let's move on to workload slicing.

  What are some places you have seen the properties of the compute workloads be
  a dividing line for a software system?

  _AUDIENCE PARTICIPATION_
]

Slicing the software based on the properties of the compute workloads

#pause

- Hardware
  - GPU vs CPU
  - FPU vs ALU in CPU
  - Efficiency cores
- Programming Language Level
  - Thread priority hints
- Module Level
  - Sidecar Pattern
  - Separate database server from main application
  - Database read replicas
- Service Level
  - AWS Lambda for irregular workloads vs EC2 for regular workloads

== Separation of Concerns: Spacial Slicing

#speaker-note[
  Let's move on to spacial slicing.

  What are some places you have seen the physical or logical location of the
  compute activities be a dividing line for a software system?

  _AUDIENCE PARTICIPATION_
]

Slicing the software based on the physical or logical location of the
compute activities
#pause

- Hardware Level
  - CPU vs GPU
- Programming Language Level
  - Thread pools
  - Thread affinity
- Module Level
  - Frontend vs Backend
  - Database Stored Procedures
  - Database vs Application Server
- Service Level
  - Sharding
  - Multi-region deployment
  - Multi-cloud deployment

== Separation of Concerns: Feature Slicing

#speaker-note[
  Let's move on to feature slicing.

  What are some places you have seen the features of the system be a dividing
  line for a software system?

  _AUDIENCE PARTICIPATION_
]

Slicing the software based on the features of the system
#pause

- Hardware Level
  - CPU, RAM, GPU, Disk, Network, ...
- Programming Language Level
  - Structs/classes
  - Functions/methods
- Module Level
  - Packages/Libraries
- Service Level
  - Netflix-style microservice architecture

== If You Can Name It, You Can Build It

#speaker-note[
  One of the easiest ways to mess up Separation of Concerns is to have concerns
  that are not well-defined/splattered.
  Ex: multiple systems that constitute the source of truth for the
  configuration of your application.

  My favorite quote about this came from a prior manager, Brad Murray, who said
  (in essence): _READ SLIDE_

  This was in reference to services, but I think it applies to concerns in
  general.
]

#quote(attribution: "Brad Murray (paraphrase)")[
  If you can name it, you know what it is. And if you know what it is, you can
  build it.
]

#pause

Once you have named a concern, it's easy to reason about its desired properties,
understand its constraints, and make decisions about trade-offs.

#speaker-note[
  _READ_SLIDE_

  "Backend" is probably not a good enough name. "Authentication Service" is.

  When you start wondering if the "Auth Service" should manage provisioning user
  resources, answer probably "no".
]

== Interfaces

#speaker-note[
  So we have a bunch of concerns, but how do we coordinate them?

  _READ SLIDE_
]

Interfaces are the contact surface between concerns. There are two models of
interface between concerns:

- *Peer-to-Peer* - concerns communicate directly with each other
- *Message Bus* - concerns communicate indirectly through a message bus

#pause

When designing interfaces, it is important to keep in mind the _Liskov
Substitution Principle_:

#quote[
  If $S$ is a subtype of $T$, then objects of type $T$ in a program may be
  replaced with objects of type $S$ without altering any of the desirable
  properties of that program (e.g., correctness).
]

#speaker-note[
  This principle applies to more than just object-oriented programming. It
  applies to any interface between concerns, whether they are objects, modules,
  or services.

  For example, LSP is the reason we can replace one service with another that
  implements the same interface without breaking the system.

  LSP advocates for us to have well-defined contracts between concerns.
]

== Interfaces: Peer-to-Peer

#speaker-note[
  Let's start with peer-to-peer interfaces.

  What are some places you have seen concerns communicate directly with each
  other?

  _AUDIENCE PARTICIPATION_
]

Concerns communicate directly with each other
#pause

- Hardware Level
  - Direct core-to-core communication
- Programming Language Level
  - Function/method signatures
- Module Level
  - Interfaces/traits
- Service Level
  - REST/GraphQL API
  - gRPC
  - OpenAPI

== Interfaces: Message Bus

#speaker-note[
  Let's start with peer-to-peer interfaces.

  What are some places you have seen concerns communicate indirectly with each
  other over a message bus?

  _AUDIENCE PARTICIPATION_
]

Concerns communicate indirectly through a message bus

- Hardware Level
  - CPU bus
  - USB/PCIe
  - Memory bus
- Programming Language Level
  - Channels
  - Greenthreads
- Module Level
  - Reactive programming
- Service Level
  - Message queues (RabbitMQ, Kafka, SQS)
  - D-Bus (Linux)

= Conway's Law

#speaker-note[
  So we have discussed a few frameworks for reasoning about software
  architecture.

  But there is one unavoidable fact that will influence the architecture of your
  software system more than anything else: the organization of the code
  producers building the system.

  That is where Conway's Law comes in.
]

#quote(attribution: "Melvin E. Conway, How Do Committees Invent?")[
  Organizations which design systems (in the broad sense used here) are
  constrained to produce designs which are copies of the communication
  structures of these organizations.
]

#speaker-note[
  _READ SLIDE_
]

#pause

Alternative phrasings

#quote[
  Any piece of software reflects the organizational structure that produced it.
]

#quote[
  If you have four teams working on a compiler, you're going to get a four-pass
  compiler.
]

#quote[
  You're going to ship your org chart.
]

#speaker-note[
  If you don't like your software architecture, you should look at your org
  structure.
]

#pause

Conway's Law applies to all code producers, including _humans and AI agents_.

#speaker-note[
  _READ SLIDE_

  I think that Conway's Law is going to be more and more important to individual
  software engineers because Conway's Law extends to AI agents as well.

  As individual contributors are increasingly expected to do more architecture,
  the organization of agents is going to be a more and more important tool in
  the software engineering toolbox.
]

== Reverse Conway Maneuver 

If you want to change your software architecture, Conway's Law suggests that you
should change your org structure.

#pause

- Want an architecture with temporally separated components interacting over a
  message bus?
  - Make a set of teams that individually own each temporally separated
    component and primarily communicate with other teams via an Architecture
    Council (message bus).

#pause

- Want an architecture with workload separated components interacting in a
  peer-to-peer architecture?
  - Make a set of teams that individually own certain workloads and force them
    to reach out directly negotiate with the other teams that they rely on.

= Conclusion

#speaker-note[
  What is the right architecture?

  As with most things: it depends.
]

Architecting software requires thinking about _trade-offs_ and _constraints_ in
relation to the _desired properties_ of a system.

#speaker-note[As I said at the beginning of the talk: _READ SLIDE_]

#pause

- Similar patterns emerge to solve problems across different levels of
  abstraction
- There is rarely anything new under the sun, many "new and shiny" languages,
  frameworks, libraries, and services are just reapplications or
  reimplementations of old ideas
- Well-rounded software engineers should understand the underlying principles
  so that when presented with new technologies, they can apply the conceptual
  frameworks they already understand to reason correctly in the new context
- Circumstances constantly change, and the architecture must evolve and adapt

#speaker-note[
  But what I want to leave you with is this: _READ SLIDE_

  _An architectural decision is only good or bad in the context of the time in
  which it was made. Which means that yesterday's good architecture could be
  today's bad architecture._

  _You have to be willing to reevaluate and change your architecture as the
  circumstances change._
]

== Additional Resources

- Casey Muratori (Software Architecture, Software Engineering History)
  - #link("https://youtu.be/hpj6r6CjJf8?si=PyXVrKLoZCbsXfuf")[The Root of the Root of All Evil]
  - #link("https://youtu.be/wo84LFzx5nI?si=YHztIRVGSi6GaJBO")[The Big OOPs: Anatomy of a Thirty-five-year Mistake]
  - #link("https://www.youtube.com/watch?v=5IUj1EZwpJY")[The Only Unbreakable Law] (Conway's Law)

- #link("https://www.seangoedecke.com/")[Sean Geodecke] (General Software Engineering Blog)

- #link("https://www.youtube.com/@RyanLPeterman")[Ryan Peterman] (Software Engineering Podcast)
