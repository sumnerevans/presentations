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

  I think that most of you probably know these concepts, but since the US
  education system does a horrible job at teaching personal finance, I want to
  make sure that everyone is on the same page.
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
- Money owed you (by friends, family, etc.)

=== Liability Examples

- Credit Card Debt
- Loans (student, personal, payday, etc.)
- Mortgages
- Car Loans

#speaker-note[
  Net worth is like a snapshot of your financial situation. The trajectory over
  time is probably more important than any particular day's/month's/year's net
  worth.

  My net worth is hovering right at the \$1M mark, depending on how the market
  performs on any given day, how much you value my house at, and a couple other
  major factors.

  But, my net worth has about doubled since 2023, so that is the trajectory that
  I care about.
]

== Liquidity

Liquidity is the ability to convert an asset into cash.

- Physical Cash, Checking/Savings Accounts
- Stocks, Bonds, Treasuries
- Real Estate, Vehicles, Jewelry, Collectibles, Artwork
- Private Equity, Business

== Cash Flow

*Cash Flow* is the amount of money you have coming in and going out over a
period of time.

You want a positive cash flow: more money coming in than going out.
#speaker-note[
  _READ SLIDE_
]

#pause
#image("resources/caleb-hammer.webp")

#speaker-note[
  You would think that this is a simple concept, but this fiscal responsibility
  is not really very common.

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

= Personal Finance Software

#speaker-note[
  But this is LUG, we are nerds so let's talk software. Obviously, tracking
  finances can be hard (we make lots of financial transactions in our lives).

  I've used a lot of personal finance software over the years.
]

- Mint (RIP)
- Personal Capital
- Rocket Money
- Origin

All of these are online SaaS platforms which connect to all your financial
accounts and automatically pull transactions and balance updates.

I think that all of these are pretty good if you are just starting out and want
to quickly see where money is going in your life.

#pause

There are also plenty of open source personal finance software options, but I
haven't used any of them.

- YNAB (You Need A Budget)
- GnuCash

#speaker-note[
  A few years ago, I felt like I needed something more powerful. I started
  tracking monthly net worth in markdown files in a git repo, and I manually
  entered every transaction into that file. I did this for quite a few years,
  and then I tried out Origin, which was pretty good.

  However, I eventually got annoyed with it because it couldn't quite grasp my
  financial situation, and I wanted to learn more about double-entry
  bookkeeping.

  I asked Claude to do some research into best practices, and it surfaced an
  option that I hadn't even heard of: plain text accounting.

  First, we have to talk about double-entry bookkeeping.
]

= Double-Entry Bookkeeping

*Double-entry bookkeeping*, also known as _double-entry accounting_, is a method
of bookkeeping in which every financial transaction is recorded with equal and
opposite entries (debits and credits) - thus "balancing the books".

#speaker-note[
  I think it's easiest to see this in action in some examples.
]

== Accounts

In double-entry bookkeeping, money#footnote[or really anything] is tracked in
*accounts*. You have different kinds of accounts for different things:

- *Asset Accounts* --- checking, brokerage, retirement, etc.
- *Liability Accounts* --- credit cards, loans, mortgages, etc.
- *Income/Revenue Accounts* --- paychecks, dividends, interest, etc.
- *Expense Accounts* --- groceries, utilities, rent, etc.
#pause
- *Equity Accounts* --- not really relevant for personal finance, I use it for
  transfer tracking

== Transactions

Every transaction is a record of money moving from some set of accounts to
another set of accounts.

In double-entry bookkeeping, the sum of each transaction must equal zero.

== Examples

*Paying for groceries with a credit card:*

- +50 USD to `expenses:food:groceries` (expense outflow)
- -50 USD from `liabilities:cc:venturex` (increases your liabilities)

#speaker-note[
  Increasing a liability makes it _more_ negative (you owe more money).

  Your expenses effectively become an asset to the store. We are effectively
  adding to the store's assets.
]

#pause

*Paying off your credit card with a bank transfer:*
- +50 USD to `liabilities:cc:venturex` (decreases your liabilities)
- -50 USD from `assets:cash:fidelity:checking` (decreases your assets)

#pause

*Buying a stock with cash:*
- +10 shares of VOO at 1,000 USD each to `assets:retirement`
- -10,000 USD from `assets:cash:fidelity:checking`

#pause

*Do you have any other transactions that you want to see an example of?*

= Plain Text Accounting

#speaker-note[
  So now for the part you've been waiting for: plain text accounting.
]
#link("https://plaintextaccounting.org/")[Plain Text Accounting] (PTA) is an
umbrella term for storing accounting data with plaintext files.

#pause

This can get tedious so PTA generally is also associated with using software
tools to modify and report on the underlying plaintext files.

#pause

Most plain text accounting programs use double-entry accounting at their core.

#pause

Since it's plain text, you don't need to use any tools at all or you can easily
create your own tooling.

#speaker-note[
  - You can use a simple text editor to edit the source files.
  - You can create custom programs to manipulate or report on your financial data.
  - You can even take advantage of the fact that plain text is AI-native and use something like Claude Code to analyse your finances for insights.
]

#pause

It's also super easy to store in source control because it's just text.

#speaker-note[
  I use a git repo to store all my financial data.
]

== hledger

There are lots of different plain text accounting programs out there, I chose to
use [hledger](https://hledger.org/).

- Haskell
- Seems like it's well-supported by its community
- Built-in tools for importing transaction CSVs
- I like its journal file format

#pause

In hledger, you create `.journal` files and put transactions in there and use
the `hledger` command line tool to report on the data from the journal.

== hledger Transaction Format

```ledger
2026-08-09 * XCEL ENERGY
    liabilities:cc:capitalone:venturex   -80.00 USD  ; date:2026-08-10
    expenses:home:utilities               80.00 USD
```

This transaction represents a utilities payment of \$80 to Xcel Energy.

#pause

Notice, the transaction sums to zero.

#pause

- `2026-08-09` --- transaction date
- `*` --- transaction has posted
- `XCEL ENERGY` --- transaction description
- `liabilities:cc:capitalone:venturex` --- account name
- `-80.00 USD` --- amount and commodity for the account
- `; date:2026-08-10` --- optional metadata (posted date)
- `expenses:home:utilities` --- account name
- `80.00 USD` --- amount and commodity for the account


// On the first line, we have the transaction date, a `*` indicating that the
// transaction has posted, and a transaction description. The subsequent lines are
// the entries that constitute the transaction. Since this is double-entry
// accounting, the entries must always sum to zero[^3] and hledger checks this as
// it reads the journal. In this case, we are taking money out of the liability
// account for my VentureX credit card and applying it towards the utilities
// account.
//
// [^3]: The money has to go from somewhere to somewhere else; it can't just
//     disappear or appear out of nowhere.
//
// The `hledger` program parses the file, and allows you to generate useful reports
// such as showing a net worth breakdown via the `balance` command or a spending
// breakdown via the `incomestatement` command. Each of these commands can be
// scoped to a certain date range and/or show trends over time.
//
// That's the essence of hledger. As I've converted to this system, I've discovered
// additional things that it helps with, some of which I didn't even know I wanted
// it to do! Below, in no particular order, is a series of things which I like
// about the system.
//
// ## Multi-Account Transactions
//
// Transactions can have more than two accounts. This is particularly helpful for
// tracking transactions where multiple payment methods are used or where there is
// a mix of expense categories. The most common instance of this situation is
// Amazon transactions where I apply Prime rewards points or a gift card against
// the total. Here is an example transaction which demonstrates this:
//
// ```ledger
// 2026-08-10 * Amazon
//     expenses:home:decor                           $37.99  ; Shoe Bench
//     expenses:shopping:tech                         $5.99  ; USB Cables
//     expenses:taxes:sales                           $2.20
//     expenses:taxes:delivery-fee                    $0.31
//     assets:gift-cards:amazon                     -$17.59
//     income:rewards:amazon-prime                   -$6.29
//     liabilities:credit-cards:chase:amazon-prime  -$22.61
// ```
//
// In this transaction, I bought two items from Amazon, which applied to two
// different expense categories, and was charged sales tax and the
// [Colorado Retail Delivery Fee](https://tax.colorado.gov/retail-delivery-fee). I
// paid with a combination of the remainder of my Amazon gift card balance, rewards
// from my credit card, and my Amazon credit card.
//
// ## Commodities + Pricing Information
//
// Assets and transactions can be tracked in terms of units of stock and currency
// while also being able to have dollar-denominated value calculations. In fact,
// there is nothing special about `$` in hledger; it's just a commodity (albeit
// with a special-case syntax) declared in a journal alongside other commodities:
//
// ```ledger
// commodity $0.00
// commodity 0.000 VOO  ; Vanguard S&P 500 ETF
// ```
//
// Transactions can then transact the commodities directly:
//
// ```ledger
// 2026-08-03 * YOU BOUGHT VANGUARD INDEX FUNDS S&P 500 ETF USD (VOO) (Cash)
//     assets:retirement:ira:roth:fidelity      -$10,450.65
//     assets:retirement:ira:roth:fidelity:VOO        15.000 VOO  @@  $10,450.65
// ```
//
// The `@@` syntax allows you to specify the total cost-basis of the 15 VOO
// shares[^4].
//
// [^4]: Technically, the `@@` syntax is a shorthand for additional equity
//     postings. See https://hledger.org/1.52/hledger.html#costs for details.
//
// But 15 VOO is not very helpful unless you know its market value denominated in
// dollars. hledger solves this by providing the ability to augment the commodities
// with pricing information from currency exchange rates or market value. I can add
// `P` (price) directives to track the price of VOO in terms of dollars.
//
// ```ledger
// ; ...
// P 2026-08-12 VOO $710.1699829101562
// P 2026-08-13 VOO $714.9500122070312
// P 2026-08-14 VOO $713.6099853515625
// ; ...
// ```
//
// All of the hledger commands allow you to report in terms of either the
// underlying commodities or the value of said commodities.
//
// ## Multi-File Journals
//
// Depending on how complicated your financial situation is, there may be lots of
// accounts and commodities to keep track of. Luckily, you can split the journal
// into separate files and `include` additional journal files. I've created one
// journal file per account so that I can view the history of a single account in a
// single file, which makes it easy to maintain on an ongoing basis.
//
// This organisation structure does present a challenge, though: which account file
// should transactions related to transfers between accounts (credit card payments,
// bank transfers, etc.) go in? That is where the next feature (that I didn't even
// know I needed) comes in.
//
// ## Transfer Tracking
//
// One of the biggest issues that I've had in the past with tracking finances is
// tracking how money is moving between my accounts. Often, a bank transfer may
// take days to settle, and I want to have visibility into when it left one bank
// and when it landed in another. The solution is an `equity:transfers` account
// representing the asset in transition. (For reasons that still don't entirely
// make sense to me, suspense accounts such as this are "equity" in double-entry
// accounting. I've been told that it's just convention.) For example, when I pay
// for my CapitalOne credit card, money moves from my checking account to pay down
// my liabilities:
//
// In the checking account journal file:
//
// ```ledger
// 2026-08-14 * DIRECT DEBIT CAPITAL ONE CRCARDPMT (Cash)
//     assets:cash:fidelity:checking  -$1,226.98
//     equity:transfers                $1,226.98
// ```
//
// and in the credit card journal file:
//
// ```ledger
// 2026-08-14 * CAPITAL ONE AUTOPAY PYMT
//     liabilities:credit-cards:capitalone:venturex   $1,226.98
//     equity:transfers                              $-1,226.98
// ```
//
// This allows both journal files to maintain a linear history that individually
// looks like the statements that I get from those accounts while keeping
// everything balanced.
//
// This point is more a feature of double-entry bookkeeping than of hledger, but
// having an automated tool makes this level of accounting rigour bearable.
//
// ## Reimbursable Expense Tracking
//
// Transfers are not the only place where intermediate accounts are useful. Another
// example is keeping track of reimbursable expenses. I created an
// [accounts receivable](https://en.wikipedia.org/wiki/Accounts_receivable) account
// for expense reimbursements from
// [my job at Can/Am]({{<ref"../../portfolio/index.md#experience-canam-tech-lead">}}):
// `assets:accounts-receivable:expense-reimbursement:canam`. This account
// represents the amount I'm floating for work-related expenses. It is an asset
// because it represents money that I am owed. Using this account allows work
// expenses to never show up as an expense on my books. Let me demonstrate this
// with an example:
//
// When I pay for travel expenses to visit a client with my personal credit card,
// instead of it showing up as a transaction against `expenses:travel`, it becomes
// an asset (future income):
//
// ```ledger
// 2025-06-23 * COT*FLT  ; DEN <-> CLT
//     liabilities:credit-cards:capitalone:venturex            $-619.17  ; date:2025-06-24
//     assets:accounts-receivable:expense-reimbursement:canam   $619.17
//
// ; ... other travel expenses
// ```
//
// Then, some time in the future after I submit my expense report and get
// reimbursed for the travel expenses, the asset is converted into cash in my
// checking account:
//
// ```ledger
// 2025-07-10 * DIRECT DEPOSIT CAN-AM TECH VENDOR (Cash)
//     assets:cash:fidelity:checking                            $1,288.24
//     assets:accounts-receivable:expense-reimbursement:canam  $-1,288.24
// ```
//
// Previously, when using other systems, I would record the reimbursable expenses
// as "travel" expenses, and the reimbursement as a negative expense against the
// same category. This approach had two major problems which this system fixes:
//
// 1. **Reimbursements across month boundaries look weird.** In one month, I would
//    have a large positive "travel" expense, and the next month I'd have a large
//    negative "travel" expense representing the refund.
// 2. **The reimbursement covered multiple expense categories.** Expenses were
//    recorded against sub-categories such as "flights", "lodging", and "food", but
//    the reimbursement was a single dollar amount.
//
//    This meant that I either had to split the reimbursement by subcategory, or
//    just deal with the fact that the expenses and subsequent reimbursement only
//    zero out at the top-level category. I found it easiest to just do the latter,
//    which was a rather unsatisfactory result.
//
// Now, the real capital outflow is recorded (so I still keep track of every
// transaction on my credit card), but it is not an "expense". Instead, it
// immediately becomes an asset, which will eventually be converted to cash in my
// bank account.
//
// ## Balance Assertions
//
// hledger allows you to specify expected balances on accounts via
// [balance assertions](https://hledger.org/1.52/hledger.html#balance-assertions).
// For example, if I know that my Venmo balance should be $82 after getting
// reimbursed for food by a friend, then I can add a balance assertion like so:
//
// ```ledger
// 2026-07-06 * Chicken Tikka masala
//     assets:cash:venmo           $32.00  =  $82.00  ; assert the resulting account balance is $82
//     expenses:food:restaurants  $-32.00
// ```
//
// If the balance that is calculated by hledger by replaying all of the
// transactions differs from the asserted balance, hledger surfaces that
// discrepancy:
//
// ```plain
// $ hledger check
// hledger: Error: /path/to/venmo.journal:10:40
//    | 2026-07-06 * Chicken Tikka masala
// 10 |     assets:cash:venmo                  $32.00 = $82
//    |                                               ^^^^^
//    |     expenses:food:restaurants         $-32.00
//
// Balance assertion failed in assets:cash:venmo
// In commodity $ at this point, excluding subaccounts, ignoring costs,
// the asserted balance is:           $82
// but the calculated balance is:  $95.43
// (difference: $-13.43)
// To troubleshoot, check this account's running balance with assertions disabled, eg:
// hledger reg -I 'assets:cash:venmo$' cur:'$'
// ```
//
// You can also do balance assertions in transactions that don't even have any
// money moving around. For example, if you get an end-of-month statement from your
// bank, you can record the balance assertions:
//
// ```ledger
// 2026-07-31 * End-of-Month Balances Based on Account Statements
//     assets:cash:checking  0  =   $1,927.79
//     assets:cash:savings   0  =  $10,000.00
// ```
//
// Alternatively, if you ever get to a point where balances get out of sync with
// reality and you don't want to figure out where the mistake happened, you can use
// balance assertions to correct your amounts going forward:
//
// ```ledger
// 2026-07-31 * End-of-Month Balance Corrections
//     asets:cash:checking   =$1,930.00
//     asets:cash:savings   =$10,000.00
//     equity:unaccounted                ; any discrepancy will be attributed to this account
// ```
//
// In this example, since the amount is omitted on the balance assertion lines, the
// amount is inferred as the difference between the computed amount and the
// asserted amount. Then, the `equity:unaccounted` line is used to absorb any
// discrepancy emerging from those assertions.
//
// ## Other Nice Features
//
// Here are a few nice features of the `hledger` tool that didn't really fit
// anywhere else in the blog post:
//
// - [hledger can read CSVs](https://hledger.org/1.52/hledger.html#csv),
//   [apply rules to them](https://hledger.org/1.52/hledger.html#csv-rules-examples),
//   and [print](https://hledger.org/1.52/hledger.html#print) the data in the
//   journal format. This made it very easy for me to import transactions based on
//   transaction exports from my various banking institutions.
// - The `hledger register` command displays all transactions (optionally scoped to
//   a specific account). This was helpful during the conversion to see when things
//   got out of balance.
// - The `hledger check` command checks the validity of your journal. It ensures
//   the transactions all sum to zero, and that the balance assertions don't have
//   any issues.
// - There is a browser-based UI called [hledger-web](https://hledger.org/web.html)
//   that uses the journal files and presents visualisations in your browser. This
//   is helpful for visualising trends like net worth over time.
//
// ## Conclusion
//
// I've been using this system for only a few weeks, and so far I am enjoying using
// it. I greatly value the benefits of plain text aided by the reporting tooling
// that hledger provides. I am also happy with the switch to double-entry
// accounting, which has solved many annoyances I had with previous systems. Of
// course, I'm back to manually entering every transaction into my ledger, but the
// amount of accounting rigour I'm able to apply to all my transactions makes it
// worth it for me.
//
// I'm still learning how to most effectively use double-entry accounting and the
// hledger tool, but so far I've been able to get all of the financial reporting
// and data I care about. I don't think I've been using it long enough to give it
// an unequivocal endorsement. However, I think that if you (1) are as obsessive as
// I am about keeping track of your finances to the last penny and (2) find having
// your financial data stored in a highly readable plain text format appealing,
// then you should look into plain text accounting.
