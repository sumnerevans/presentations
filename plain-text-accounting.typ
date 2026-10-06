#import "@preview/touying:0.8.0": *
#import themes.metropolis: *

#set text(font: "Iosevka")

#show: metropolis-theme.with(
  aspect-ratio: "4-3",
  footer: self => self.info.institution,
  config-info(
    title: [Plain Text Accounting],
    subtitle: [How I Track My Personal Finances Using Text Files],
    author: [Sumner Evans],
    date: datetime(year: 2026, month: 10, day: 22),
    institution: [Mines LUG],
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

= Personal Finance

#speaker-note[
  I like to keep track of my finances pretty religiously, and I recommend that
  everyone does so.

  I want to start by talking about a couple of fundamental personal finance
  concepts.
]

== Net Worth

*Net Worth* is the total value of your assets minus your liabilities.

=== Asset Examples

- Cash (in bank accounts, physical currency, etc.)
- Securities (stocks, bonds, treasuries) across all accounts (brokerage, retirement, etc.)
- Real Estate (your home, rental properties, land, etc.)
- Vehicles (cars, motorcycles, boats, etc.)
- Equity (RSUs, business ownership, etc.)
- Personal Property (jewelry, collectibles, etc.)

=== Liability Examples

- Credit Card Debt
- Loans (student, personal, payday, etc.)
- Mortgages
- Car Loans

== Cash Flow

*Cash Flow* is the amount of money you have coming in and going out over a
period of time.

You want a positive cash flow: more money coming in than going out.
#pause
#image("resources/caleb-hammer.webp")

#speaker-note[
  _READ SLIDE_

  You would think that this is a simple concept, but this fiscal responsibility
  is not really very common.
]

#speaker-note[
  Has anyone watched Caleb Hammer?

  He has a YouTube channel where he basically berates people for their poor
  financial decisions, negative cash flow being one of the most common ones.
]

== Savings Rate

*Savings Rate* is the percentage of your income that you save (don't spend)
over a period of time.

#pause

The 50/30/20 rule is a common guideline which says that you should:

- Spend 50% of your income on needs
- Spend 30% of your income on wants
- Save 20% of your income 

Obviously, if you can spend less and save more, that is normally better (unless
you are greatly sacrificing your quality of life in the present).

== Budgeting

*Budgeting* is the process of planning out expenditures ahead of time.

This can be helpful for predicting cash flow, or constraining spending to meet
your savings goals.

#pause

I'm going to be honest that I don't really budget very strictly. I mainly just
track my savings rate and net worth, so we aren't going to really talk too much
about this.

= Double-Entry Bookkeeping

*Double-entry bookkeeping*, also known as _double-entry accounting_, is a method
of bookkeeping in which every financial transaction is recorded with equal and
opposite entries (debits and credits) - thus "balancing the books".

== General Ledger

= Personal Finance Software

- Personally Used
  - Mint
  - Personal Capital
  - Rocket Money
  - Origin
- Applications I looked into
  - YNAB (You Need A Budget)
  - GnuCash

= Plain Text Accounting

- hledger
