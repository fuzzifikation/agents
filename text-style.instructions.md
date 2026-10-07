---
name: Text Style
description: "How this owner's prose must read: no AI filler, repetition only when marked, structure follows length, topic first and punch last, one name per thing, comparisons like-for-like. Governs narrative text, not code."
applyTo: "**/*.md,**/*.tex,**/*.rst,**/*.txt"
---

# Text Style — Prose Law for AI-Authored Text

Position: prose is good when a skimming reader ends up correct and a careful reader is never bored. Everything below serves one of those two readers. Kill the filler (§1), mark the repetition you keep (§2), keep one name per thing and compare like with like (§3), put the point where the eye lands, never bury it under a comma, and never let a discipline act or a pronoun float (§4), frame long units at both ends (§6), then prove it with the audit in §5 and the test in §8. A short text gets no frame: structure follows length.

Rules for anything a human will read: docs, READMEs, changelogs, release notes, design docs, papers, lecture notes, long commit messages. Code is not prose: identifiers and comments obey the simplicity laws in `working-principles.instructions.md`. A project may add a domain overlay (LaTeX/math, legal, marketing) that tightens these rules; it may not loosen them.

Voice: dry, direct, slightly mean about the engineering, never about the reader. Humour is allowed. Filler is not.

Every rule here exists because its violation was found in real text. Cite the rule number when you edit. Rule numbers are permanent identifiers — other repositories cite them. Never renumber; a new rule takes the next free number and sits wherever it belongs.

## 1 Kill criteria

1. **No announcers.** Never state that you are about to say something. Dead on sight: "In this section we…", "It is worth noting", "We now turn to", "As we will see", "Note that" unless it introduces a genuine trap. A long unit still needs an opening preview (rule 30) — that is content, not an announcement.
2. **No paraphrase twins.** If a sentence begins "In other words", "This means", "That is,", one of the two halves dies. Per-sentence test: does it add information, a consequence, or an example? If none of the three, delete it.
3. **One rhetorical template per section.** "X alone does not establish Y", "is not sufficient evidence", "does not certify" — each shape once per section, then cut the claim or word it differently. Nine identically shaped sentences in one document is a machine fingerprint even when all nine are true.
4. **No filler adjectives.** Banned: crucial, vital, key, powerful, robust (unless a term of art), significant/significantly (unless a statistical claim), seamless, inherent, pivotal, comprehensive, delve, leverage, showcase, underscore, facilitate, utilise, furthermore, moreover, notably, additionally, particularly, testament, landscape. This is the excess vocabulary LLMs sprayed over technical and academic prose after 2022: *delve* ran ~25× above trend by 2024, *showcase* and *underscore* ~9× (Kobak et al. 2024). A repo's own terms of art (vendor, stamp, ledger, law) are exempt — they name things.
5. **Adverbs become conditions.** "Often", "typically", "generally", "usually" are forbidden where the real condition fits in the same space. "Retries often fix this" has not been thought through: write when they do and when they do not.
6. **One image per idea, and never explain it.** A good aphorism gets no sequel.
7. **Max one colon or dash per sentence.** The tell is dash density *inside* a sentence and dash-introduced mini-summaries, not dashes per document — measured LLM English (about 10.6 per 1000 words) is barely above Mark Twain (about 10). Full stops are not a personality flaw.
8. **No thesis/antithesis tics** ("not X — Y", "it is not about X, it is about Y") more than once per section.

## 2 Repetition

Repetition for emphasis is legitimate. **Unmarked** repetition is a defect: the reader cannot tell emphasis from accident, and the third copy is where reading stops.

9. State a claim in full **once per document**, where it is established. Later appearances are cross-references, not restatements.
10. **Deliberate recaps announce themselves** with the project's marker — "(recall §2.4)", "(standing ruling)", "(see Ruling 2026-03)" — so a grep lists every recap and each can be audited for earning its place. This is what makes the standing-rulings law in `working-principles` legal: those repeats are marked as rulings, not disguised as new findings.
11. **Two full statements of a warning per document, maximum** — one where it is derived, one where it bites. Later appearances are marked pointers.
12. **Full restatement is legal only in:** the summary at the top, the user-facing entry point (README quick start, learning outcomes, release-note intent paragraph), and the place of application.
13. Restating is cheap for the writer and expensive for the reader: rereading is a demonstrably low-utility way to learn, while retrieval and spacing are high-utility (Dunlosky et al. 2013). A recap that demands nothing of the reader is decoration. Prefer pointer plus demand:

    > The check is the one in §2.4. Which of the two inputs makes it fail, and why?

## 3 Names

14. **No name before its meaning is available.** First use defines it in the same sentence or points at the definition. Symbols, identifiers, CLI flags, env vars and internal jargon alike.
15. **One name, one meaning.** Before introducing a name, grep the project for it. If a second meaning wants the name, one of them relents.
16. **Same thing, same name.** Never vary a technical term to avoid sounding repetitive: "the actual regressor" does not become "the signal", "the input", "the driving term" in consecutive sentences. Elegant variation is a fault in prose and a correctness bug in code.
17. **Names pay rent** (Structural Review agent): do not coin a term, macro, or named constant for something mentioned once. Halmos: the best notation is no notation.

18. **Compare like with like.** A comparison, a contrast and a parallel construction must join two things of the same type: parameters with parameters, not a parameter with a controller; a magnitude with a magnitude, not a magnitude with a relation; a function with a function, not a function with the act of changing one. The tell is "uses X rather than doing Y" — join a noun with a noun or a verb with a verb. The reader can usually guess the intent, and that is no defence: a mixed comparison shows that the writer has not thought the distinction, which is why it belongs next to unit errors in the ranking of stupid mistakes. Fix the type, not the wording. "Before adjusting a controller online we ask what we would do with known parameters" became "Before adjusting a controller's parameters over time, we design a fixed-parameter controller for a known plant".

## 4 Sentences

19. **Topic first, punch last.** Readers take the sentence start as context and the sentence end as the point (Gopen & Swan). Put the condition where the eye starts, the consequence where the sentence lands. Weak: "The build fails, in the case where the flag is unset." Strong: "With the flag unset, the build fails."
20. **Under ~25 words.** A longer sentence is licensed only when the dependency between its clauses is itself the content. Short prose measurably out-cites long prose (Weinberger et al. 2015).
21. **Verbs, not nominalisations.** "We exploit", not "we make use of"; "the error converges", not "the error exhibits convergence". Passive voice only when the actor is genuinely irrelevant, and never "it is seen" without saying by whom and from what.
22. **No hand-waving words.** "Clearly", "obviously", "trivially", "simply", "easily", "it can be shown", "one can show", "it is well known" either carry the argument or a citation, or they go. They are how authors hide work they have not checked (Knuth), and in documentation they mark where the bug is.
23. **No "-ing" tails selling significance** — "…, thereby ensuring consistency", "…, highlighting the need for care". Cut, or state the consequence in its own sentence.
24. **No padding structures:** rule-of-three lists where two items serve; negative parallelism ("not only X but also Y"); a section-closing summary sentence ("Overall, these results show…", "Together, these findings…"); a hedging preamble followed by the assertion anyway. Long units close with a consolidation device instead — rule 31.

25. **Plain statement first, qualification after.** When a plain sentence and a hedged one cost the same words, write the plain one and give the qualification its own sentence. "We often omit $(t)$ from signals, but not their time dependence" is three clauses doing one job; "We often omit $(t)$ from time-dependent signals" is one. Forbidden shapes: a main clause dragged along by a contradictory tail ("X, but not Y", "X, and not Y"); chained relatives ("…, which is why …, which is what …"); any point that survives only if the reader keeps the subordinate clause. If the hedge carries information it earns a sentence; if it does not, delete it. Engineers write the shortest sentence that cannot be misread, and a political-science major writes the longest one that cannot be blamed.

34. **Abstractions do not act.** A discipline, theory, method, literature, objective, problem or definition has no mouth, no brain and no pen: it does not ask, want, argue, claim, wonder, admit, worry, notice, remember, decide, settle or care. Wrong: "Robust control asks whether the closed loop meets prescribed requirements." Right: "In robust control the engineer prescribes requirements that the closed loop must satisfy for every plant in an admissible uncertainty set." Legal subjects and their predicates: people (the designer chooses, we assume), devices and signals (the controller saturates, the error converges), mathematical artifacts with logical predicates only (the theorem proves, the bound bounds, the condition rules out, the figure shows). Convert a field into a location (*in* robust control) or promote its practitioners to the actor. Why this is law, not taste: it is rule 18's category error aimed at the subject slot, it forces the reader to invent an actor, and it is the loudest fingerprint of prose trained on humanities academic writing, where "X argues" is a genre convention. A model has to be told this explicitly, because its corpus never once had to say who does the work.

35. **A reference resolves to one named thing, of the right category.** Every pointing word owes this: `it`, `they`, `this`, `that`, `which`, `there`, `here`, `the latter`.
    (a) Two candidate antecedents, one loser: repeat the noun (Google's fix for "it doesn't change" is "the text doesn't change").
    (b) A demonstrative takes a noun: "this bound", "that choice", "these two settings" — never a bare "This is…".
    (c) A locative names its container, and the preposition must match the category: *in* a field, *in* a set, *in* an equation, *in* Case 4, *at* a frequency. Forbidden: "There the unknown parameters may still shape the response" — inside the field? the uncertainty set? the paragraph? The writer never decided, so the reader guesses.
    (d) After a display, never open with "Here $x$ is…": name the display ("In \eqref{eq:PE} the symbol $\succeq$ denotes…") or make the thing the subject ("The inequality $e_c^2\le2V_0$ follows from the Lyapunov bound").
    (e) A sentence-level "…, which proves X" is legal only when the whole preceding clause is the sole possible referent — and it is a *cure*, not a crime: KTH's engineering guide prescribes it to replace a bare "This is because". Same test either way.
    (f) Exempt: existential "there is/are" ("There are $2n-1$ states") points nowhere.
    Test before shipping: name the antecedent in three words. Fail, and the sentence has no content — no synonym will give it one. Unclear reference is the most-cited fault in every engineering style guide that exists (Zeiger; Williams; Federal Plain Language Guidelines; Google developer style guide; KTH), which is why an AI must assume it is doing it and check.

36. **Characters as subjects, actions as verbs.** Williams' clarity principle: a sentence is clear when its grammatical subject is the character the sentence is about and its main verb is what that character does. "The designer chose a lower gain", not "a lower gain was chosen" and not "the choice of a lower gain was made". Zombie nouns — *the convergence of*, *the implementation of*, *an analysis of* — evict the actor and the action together, which is how agentless prose hides the fact that nobody decided anything (Sainani: "we identified a risk factor", not "we report the identification of a risk factor"). Self-check: take twenty consecutive sentences; in at least 70% the subject must be a character, and in at least 70% the main verb must be an action (Williams; threshold as taught in Boston University's writing programme). Score under that and you have not written abstractly on purpose — you have not worked out who does the work. Rule 21 kills the nominalisation; this one hunts the missing actor.


## 5 Process

26. **Cite the rule.** Every AI-assisted prose edit names the rule that motivated it. No rule, no edit — it was decoration, so revert it.
27. **A prose edit must be provably prose-only.** Before and after, compare per-file counts of headers, links, code fences, inline code spans, and any math or verbatim blocks. Word count may move; those counts may not. If they move, the edit changed content and needs a technical justification.
28. **Audit before declaring done.** Expect near-zero hits; justify each survivor out loud. Quoted examples are exempt: a file naming the crimes must match its own grep, and its prose still must not. POSIX:

```sh
grep -rniE 'in this section|it is worth|we now turn|note that|as we will see|clearly|obvious|trivial|simply|in other words|this means|it can be shown|it is well known' --include='*.md' --include='*.tex' .
grep -rniE 'delve|showcas|underscor|crucial|vital|notably|additionally|particularly|comprehensive|leverag|facilitat|utiliz|pivotal|seamless|landscape|testament|significantly' --include='*.md' --include='*.tex' .
grep -rniE 'does not establish|not sufficient|not a proof|not certify|does not by itself|alone does not' --include='*.md' --include='*.tex' .
grep -rniE ', (ensuring|highlighting|underscoring|showcasing|demonstrating|indicating|reflecting|enabling|revealing)|not only|in summary|in conclusion|^overall|together, these|it is important' --include='*.md' --include='*.tex' .
grep -rniE '\b(control|theory|field|discipline|method|approach|framework|literature|objective|definition|problem|analysis|design|chapter|section)\s+(asks|wants|argues|claims|believes|knows|worries|cares|insists|admits|prefers|refuses|decides|settles|forgets|remembers|notes|observes)\b' --include='*.md' --include='*.tex' .
grep -rniE '(^|[.;:] )(This|That|These|Those)\s+(is|are|shows|proves|means|follows|fails|gives|makes|leaves|requires|explains|implies)|(^|[.;:] )It\s+(is|does|follows|holds|can|may|gives|needs|makes|costs)|(^|[.;:] )(There|Here)[,\s]' --include='*.md' --include='*.tex' .
```

Windows: `Select-String -Path *.md,*.tex -Pattern '<same pattern>'`. More than one hit per section for the third pattern is a rule-3 violation. A hit in the fifth pattern is a rule-34 violation unless the subject literally has a mouth. In the sixth, existential *there is/are* is a known false positive and a demonstrative already followed by a noun is clean; every other hit owes you a three-word antecedent (rule 35). Expect the sixth to fire often in mathematical prose — that is the point: it marks every spot where the writer must prove the referent is unique.

## 6 Long texts

Short texts need no frame: a preamble and a recap around 600 words is two paragraphs of throat-clearing around four paragraphs of content. Length decides structure. The thresholds below are calibrated defaults, not physics — the screen figures come from skimming data (readers budget roughly 4 extra seconds per additional 100 words, and reading gets erratic past ~1250 words on a page: Weinreich et al. 2008); the print figures are a deliberate doubling, because studied text is read more slowly than scanned text. Tune per medium and say which you used.

| Unit length | Opening | Closing |
|---|---|---|
| ≤ 500 words (screen) / ≤ 1000 (print) | nothing — headings carry it | nothing |
| above that, up to a chapter | preview: 2–4 sentences | nothing |
| a chapter or long section (> ~1500 screen / ~3000 print words, or ≥ 5 subsections) | preview | consolidation |
| whole document (> ~6000 words) | standalone front matter (rule 33) + preview per unit | consolidation per unit |

29. **Structure follows length, not taste.** Apply the table. Adding a recap to a short note is a rule violation, not caution.
30. **A long unit opens with a preview, never an announcer.** A preview delivers three things an announcer does not: the conclusion or claim, the order of the argument and why that order, and the stake (which decision the reader can make afterwards). Under ~120 words for a chapter. If you cannot write the conclusion in the first sentence, the unit has no point yet — find it before writing prose. (Advance organizers: Ausubel 1968; readers given the organizing context *before* reading comprehend and recall far more of the same text: Bransford & Johnson 1972; cues that organize help learners select and connect: Mayer's signaling principle.)
31. **A long unit closes by consolidating, not paraphrasing.** Reading a prose recap of what was just said is rereading, a low-utility technique (Dunlosky et al. 2013), and it is the classic machine tell ("Overall, …"). Use one of the three devices that do work, at most five items: **retrieval prompts** (questions the reader answers from memory — prequestions and postquestions both out-predict rereading); **consequence statements** (what the result forbids, what breaks if the assumption dies); **a decision rule** (how to choose in practice). Note the conflict in the literature and settle it by who does the work: students *writing* a summary gains (~0.8 in Marzano et al. 2001), generic instruction to summarize rates low (Dunlosky et al. 2013). So make the reader produce something; never recite at them.
32. **Pass the skim test.** A reader who reads only the title, the headings, the first paragraph of each unit and the last consolidation must come away with a *correct but incomplete* model — never a wrong one. If the skim path misleads, fix the structure: move the conclusion up, rename the heading, or rewrite the preview. This is a check, not a licence to write bad body prose: readers who skim exist (rule 33), and they are your cheapest audience.
33. **Front matter for decision-makers stands alone.** For a report, proposal or management-facing document, the opening summary must be complete without the body: state the conclusion, the ask, the cost, the risk — never "this document discusses X", which names a topic instead of a position. Order by importance, not by discovery, so every paragraph survives being the last one read (inverted pyramid; practitioner guidance from the same skimming evidence). Where the discipline expects method-first (a paper's IMRaD, a proof's lemma sequence), keep the discipline and add the conclusion in the abstract or first paragraph — do not choose between them.

## 7 Domain overlays

Typeset mathematics needs more than this file: displays punctuated as sentence parts, no sentence-initial symbols, recaps marked by a macro, a fixed spelling variety. That law lives in the project holding the problem — for the adaptive-control lecture notes, `writing-rules.md` beside `main.tex`. When a second project needs the same rules, promote them upstream by hand, which is how everything else here arrived.

## 8 The closing test

Six questions, answered from memory before re-reading a rule. A rule you cannot recall was not worth writing.

1. Which rule fires on: "In this section, we will see why the cache matters."?
2. A sentence reads "We omit the argument from signals, but not their time dependence." Which rule, and what replaces it?
3. You want to repeat a warning for the third time. What must the repeat carry to be legal?
4. "Before adjusting a controller online we ask what we would do with known parameters." Which rule, and what is the fix?
5. Your document's skim path (title, headings, first paragraphs) leaves a manager with the wrong conclusion. What is broken — the prose or the structure?
6. Two sentences: "Robust control asks whether the closed loop is stable. There the unknown parameters still matter." Name both rules and both fixes.

Answers: 1 (rule 1 — and the sentence still owes its claim); 2 (rule 25 — plain statement first: "We omit the argument from time-dependent signals."); 3 (a new consequence, a decision, or a marker naming where it was established — rules 10, 11); 4 (rule 18 — a parameter may be compared only with a parameter: "Before adjusting a controller's parameters over time, we design a fixed-parameter controller for a known plant"); 5 (the structure — rule 32; fix the order, not the adjectives); 6 (rule 34 — a discipline has no mouth, so name the practitioner and make the field a location: "In robust control the engineer checks whether the closed loop is stable"; rule 35 — "There" named no container, so name one: "Inside that uncertainty set, the plant parameters still matter, provided the bound holds").

## 9 Sources

1. Gopen & Swan, *The Science of Scientific Writing*, American Scientist 78(6), 1990 — topic and stress positions.
2. Weinberger, Evans & Allesina, *Ten Simple (Empirical) Rules for Writing Science*, PLoS Comp. Biol. 11(4), 2015 — shorter sentences correlate with higher citation impact.
3. Knuth, Cherry & Guibas, *Mathematical Writing*, 1989 — no "clearly/obviously/trivially"; text must carry the argument.
4. Halmos, *How to Write Mathematics* — notation economy, cut the irrelevant, write for the second reader.
5. Dunlosky et al., *Improving Students' Learning With Effective Learning Techniques*, PSPI 14(1), 2013 — rereading low utility, retrieval and spacing high utility.
6. Kobak et al., *Delving into ChatGPT usage in academic writing through excess vocabulary*, 2024 — excess style-vocabulary across 14M abstracts post-2022; at least 10% of 2024 PubMed abstracts carried LLM fingerprints.
7. Wikipedia, *Signs of AI writing* — rule-of-three padding, "-ing" tails, sectional summaries, negative parallelism, hedged assertions.
8. Ausubel, *Educational Psychology: A Cognitive View*, 1968 — the advance organizer: what comes before the text shapes what the text can become in the reader's head.
9. Bransford & Johnson, *Contextual prerequisites for understanding*, JVLVB 11(6), 1972 — the same passage, comprehensible or incomprehensible depending on whether the organizing context came before or after.
10. Mayer, *Multimedia Learning*, 2nd ed., 2009 — signaling helps selection and organization; coherence and redundancy say unneeded words cost learning. Structure yes, repetition no.
11. Marzano, Pickering & Pollock, *Classroom Instruction That Works*, 2001 — summarization near d≈0.8 **when the learner produces it**. Read against Dunlosky et al. (source 5), which rates summarization low: the disagreement is about who does the work. Rule 31 settles it by making the reader produce something.
12. Weinreich et al., *Not Quite the Average: An Empirical Study of Web Use*, ACM TOWeb 2(1), 2008, and the Nielsen Norman Group analyses built on it (*How Little Do Users Read*, *Inverted Pyramid*) — reading time grows ~4.4 s per extra 100 words, so the fraction read shrinks as length grows; conclusions belong at the front.
13. Williams, Bizup & Trimble, *Style: Lessons in Clarity and Grace*, 12th ed., 2019 — the clarity principle: characters as grammatical subjects, actions as main verbs; nominalisations ("zombie nouns") evict both; twenty-sentence self-check at a ~70% threshold (as taught in Boston University's writing programme). Foundation of rule 36.
14. Zeiger, *Write Right! Communication Skills for Practicing Engineers*, 2nd ed., 2000 — engineering prose has no licence for ambiguity: when a pronoun could point two ways, repeat the noun. Rule 35(a).
15. Sainani, *Writing in the Sciences*, Stanford University, 2012– — agent as subject, verbs instead of nominalisations, "we identified" instead of "we report the identification of". Rule 36.
16. Google, *Developer Documentation Style Guide*, section *Pronouns*; U.S. *Federal Plain Language Guidelines*; KTH writing guide, *Use of pronouns with a clear reference* — a demonstrative takes a noun ("set this value", never "set this"); repeat the noun rather than risk a second referent; the agentless passive as a failure to say who is responsible. Rules 35(b), 35(c).
