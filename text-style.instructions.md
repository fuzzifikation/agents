---
name: Text Style
description: "Prose law for text a human reads: point before detail, actors as subjects, short subjects with early verbs, kill filler, one name per thing, references that resolve, structure follows length. Not for code."
applyTo: "**/*.md,**/*.tex,**/*.rst,**/*.txt"
---

# Text Style

Good prose leaves a skimming reader correct and never bores a careful one.
The reader should never ask "what is going on" while holding your words in
memory: the point arrives first, the details follow. It applies to anything
a human reads: docs, READMEs, changelogs, design docs, papers, lecture
notes, long commit messages. Code obeys the simplicity laws WP30–WP36 in
`working-principles.instructions.md`. A project may add an overlay that
tightens these rules; it may not loosen them.

Voice: dry, direct, mean about the engineering, never about the reader.

Rule numbers are permanent identifiers — other repositories cite them.
Never renumber; a new rule takes the next free number. Retired rules say so
and their numbers stay dead. A rule therefore sits under its own topic, not
in numeric order: 34–36 belong to §4 and sit after 25. Do not "fix" that.

## 1 Kill criteria

1. **No announcers.** "In this section we…", "It is worth noting", "We now turn to", "As we will see" die on sight. "Note that" survives only for a genuine trap. The opening preview of rule 30 is content, not an announcement.
2. **No paraphrase twins.** When a sentence starts "In other words", "This means" or "That is,", one of its two halves dies. A sentence must add information, a consequence, or an example; if it adds none, delete it.
3. **One rhetorical template per section.** "X alone does not establish Y", "is not sufficient evidence", "does not certify": each shape once per section. Nine identically shaped caveats is a machine fingerprint even when all nine are true.
4. **No filler adjectives.** Banned: crucial, vital, key, powerful, robust (unless a term of art), significant/significantly (unless a statistical claim), seamless, inherent, pivotal, comprehensive, delve, leverage, showcase, underscore, facilitate, utilise, furthermore, moreover, notably, additionally, particularly, testament, landscape. A project's own terms of art are exempt: they name things.
5. **Adverbs become conditions.** Where "often", "typically", "generally" or "usually" hides a testable condition, write the condition: when it holds, and when it does not.
6. **One image per idea, and never explain it.**
7. **Max one colon or dash per sentence.** Judge dash density inside a sentence, not dashes per document. A full stop is not a personality flaw.
8. **No thesis/antithesis tics.** "not X — Y", "it is not about X, it is about Y": once per section, maximum.

## 2 Repetition

Unmarked repetition is a defect: the reader cannot tell emphasis from accident, and the third copy is where reading stops.

9. **State a claim in full once per document**, where it is established. Later appearances are cross-references.
10. **Deliberate recaps announce themselves** with the project's marker — "(recall §2.4)", "(standing ruling)" — so one grep lists every recap and each can be audited for earning its place.
11. **Two full statements of a warning per document, maximum:** one where it is derived, one where it bites. Later appearances are marked pointers.
12. **Full restatement is legal in three places only:** the summary at the top, the user-facing entry point, and the place of application.
13. **A recap must demand something.** Rereading is a demonstrably poor way to learn, and a prose recap demands nothing. Write pointer plus question: "The check is the one in §2.4. Which of the two inputs makes it fail, and why?"

## 3 Names

14. **No name before its meaning is available.** First use defines it in the same sentence or points at the definition. Symbols, identifiers, CLI flags, env vars and jargon alike.
15. **One name, one meaning.** Grep the project before introducing a name. If a second meaning wants it, one of them relents.
16. **Same thing, same name.** "The actual regressor" does not become "the signal", then "the input", then "the driving term". Elegant variation is a fault in prose and a correctness bug in code.
17. **Names pay rent.** Do not coin a term, macro, or named constant for something mentioned once.
18. **Compare like with like.** A comparison joins two things of the same type: parameters with parameters, magnitudes with magnitudes, functions with functions. The tell is "uses X rather than doing Y". Fix the type, not the wording. "Before adjusting a controller online we ask what we would do with known parameters" → "Before adjusting a controller's parameters over time, we design a fixed-parameter controller for a known plant". A mixed comparison is a category error and belongs next to unit errors.

## 4 Sentences

19. **Topic first, punch last.** Put the condition where the eye starts and the consequence where the sentence lands. "The build fails, in the case where the flag is unset" → "With the flag unset, the build fails".
20. **Under ~25 words.** Go longer only when the dependency between the clauses is itself the content.
21. **Verbs, not nominalisations.** "We exploit", not "we make use of"; "the error converges", not "the error exhibits convergence". Passive voice only when the actor is genuinely irrelevant, and never "it is seen" without the by whom and the from what.
22. **No hand-waving words.** "Clearly", "obviously", "trivially", "simply", "easily", "it can be shown", "one can show", "it is well known": carry the argument or a citation, or they go. In documentation they mark where the bug is.
23. **No "-ing" tails selling significance.** "…, thereby ensuring consistency", "…, highlighting the need for care": cut, or give the consequence its own sentence.
24. **No padding structures.** Rule-of-three lists where two items serve; "not only X but also Y"; a section-closing summary sentence ("Overall, these results show…"); a hedging preamble followed by the assertion anyway. Long units close with rule 31 instead.
25. **Plain statement first, qualification after.** "We often omit $(t)$ from signals, but not their time dependence" → "We often omit $(t)$ from time-dependent signals". Forbidden: a main clause dragged along by a contradictory tail ("X, but not Y"); chained relatives ("…, which is why …, which is what …"); any point that survives only if the reader keeps the subordinate clause. A hedge that carries information earns its own sentence; one that does not, delete.
34. **Abstractions do not act.** A discipline, theory, method, literature, objective, problem or definition has no mouth: it does not ask, want, argue, claim, wonder, admit, notice, decide or care. "Robust control asks whether the closed loop is stable" → "In robust control the engineer checks whether the closed loop is stable". Convert the field into a location (*in* robust control) or promote its practitioners to the actor. Legal subjects: people (the designer chooses; we assume); devices and signals (the controller saturates; the error converges); mathematical artifacts with logical predicates only (the theorem proves; the bound bounds; the condition rules out; the figure shows).
35. **A reference resolves to one named thing, of the right category.** Every pointing word owes this: `it`, `they`, `this`, `that`, `which`, `there`, `here`, `the latter`.
    (a) Two candidate antecedents: repeat the noun. "The text doesn't change", not "it doesn't change".
    (b) A demonstrative takes a noun: "this bound", "that choice" — never a bare "This is…".
    (c) A locative names its container, and the preposition matches that category: *in* a field, *in* a set, *in* an equation, *in* Case 4, *at* a frequency. "There the unknown parameters still matter" names no container, so the reader picks one.
    (d) After a display, never open with "Here $x$ is…". Name the display ("In \eqref{eq:PE}, $\succeq$ denotes…") or make the thing the subject ("The inequality $e_c^2\le2V_0$ follows from the Lyapunov bound").
    (e) A sentence-level "…, which proves X" is legal only when the preceding clause is the sole possible referent. It is the prescribed cure for a bare "This is…", not a crime.
    (f) Exempt: existential "there is/are" points nowhere, and so does the cleft "it is the error variable *that* has an equilibrium".
    Test before shipping: name the antecedent in three words. If you cannot, the sentence has no content and no synonym will give it one.
36. **Characters as subjects, actions as verbs.** "The designer chose a lower gain", not "a lower gain was chosen" and not "the choice of a lower gain was made". Zombie nouns (*the convergence of*, *the implementation of*) evict the actor and the action at once. Self-check twenty consecutive sentences: at least 70% must take a character as subject and at least 70% an action as main verb. Rule 21 kills the nominalisation; this one hunts the missing actor.
37. **No train as subject.** The verb arrives within about five words of the subject; lists sit after the verb, never in front of it. "The plan, the decisions, the wire contract, the settings reference, and the structure rules all live here" forces the reader to hold five nouns in memory before learning what they do — this passes rules 19 and 36 and still reads like a shipping manifest. Fix: "This file is the whole plan. It covers the wire contract, the settings, and the structure." (Federal Plain Language Guidelines: keep the subject, verb, and object close together.)
38. **Every paragraph's first sentence stands alone.** It states the paragraph's point; a skimming reader who reads only first sentences gets a correct, incomplete model of the section — rule 32's skim test at paragraph scale. "We often write the way we think, premises first and conclusion last. Move the conclusion up; do not make readers hold information before reaching the point."
39. **Main point first, exceptions and long conditions after.** A short condition may lead (rule 19). An exception the reader has not seen the rule for must come after the rule: "Except as described in (b), the review period starts when the submission is complete" → "The review period starts when the submission is complete; paragraph (b) holds an exception." Several conditions in one sentence: split them into a list, each item one condition.
40. **The subject speaks first, never the container.** No document or section opens with "This file is…", "This document discusses…", "These notes cover…" — rule 33's ban on topic-naming front matter, applied to every opening sentence. Open on the thing itself: "Unified Mixers is one program that owns model traffic on machines you control." A later line may set expectations about the document only when it carries a decision: "This file stays current; git holds the history."

## 5 Process

41. **Reread as the reader, once, before sending.** For every changed paragraph: does the first sentence stand alone (38), does the verb land near the subject (37), can you name each sentence's actor in three words (36)? Reading load is the defect; greps cannot feel it. Retired 2026-10, numbers stay dead: rule 26 (cite the rule in every edit), rule 27 (before/after structure counts), rule 28 (audit-grep declaration) — traceability theater for a quality department that does not exist.

The fingerprint sweep below stays available as a quick machine pass over rule 1–4, 23, 34 and 36 candidates. It lists candidates, never verdicts; reading is the audit.

```sh
grep -rniE 'in this section|it is worth|we now turn|note that|as we will see|clearly|obvious|trivial|simply|in other words|this means|it can be shown|it is well known' --include='*.md' --include='*.tex' .
grep -rniE 'delve|showcas|underscor|crucial|vital|notably|additionally|particularly|comprehensive|leverag|facilitat|utiliz|pivotal|seamless|landscape|testament|significantly' --include='*.md' --include='*.tex' .
grep -rniE 'does not establish|not sufficient|not a proof|not certify|does not by itself|alone does not' --include='*.md' --include='*.tex' .
grep -rniE ', (ensuring|highlighting|underscoring|showcasing|demonstrating|indicating|reflecting|enabling|revealing)|not only|in summary|in conclusion|^overall|together, these|it is important' --include='*.md' --include='*.tex' .
grep -rniE '\b(control|theory|field|discipline|method|approach|framework|literature|objective|definition|problem|analysis|design|chapter|section)\s+(asks|wants|argues|claims|believes|knows|worries|cares|insists|admits|prefers|refuses|decides|settles|forgets|remembers|notes|observes)\b' --include='*.md' --include='*.tex' .
grep -rniE '(^|[.;:] )(This|That|These|Those)\s+(is|are|shows|proves|means|follows|fails|gives|makes|leaves|requires|explains|implies)|(^|[.;:] )It\s+(is|does|follows|holds|can|may|gives|needs|makes|costs)|(^|[.;:] )(There|Here)[,\s]' --include='*.md' --include='*.tex' .
grep -rniE '\b(the|this|that|a|an|its|our|their)\s+([a-z]+(tion|sion|ment|ance|ence|ing))\s+of\b' --include='*.md' --include='*.tex' .
```

Windows: `Select-String -Path *.md,*.tex -Pattern '<same pattern>'`. Reading the hits: more than one per section on grep 3 breaks rule 3; any hit on grep 5 breaks rule 34 unless the subject has a mouth; on grep 6 existential "there is/are" is a false positive and a demonstrative already followed by a noun is clean, so every other survivor owes you a three-word antecedent.

Three standing false positives:

* **Grep 7 (rule 36) and its evil twin.** "*the convergence of*", "*the implementation of*" name a hidden actor. Never audit rule 36 with an `is/are` + participle grep: in technical prose *is bounded*, *is stable*, *is Hurwitz*, *is positive definite* are predicate adjectives, not hidden actors. One such grep reported 32 violations in a chapter where 24 were "is bounded".
* **Grep 2 and grep 4 keep the load-bearing words.** "additionally" inside a definition ("asymptotic stability additionally requires convergence") states an extra condition; "not only" ("holds from every initial state, not only from nearby ones") excludes a real alternative. Both stay.
* **Math nouns are not zombie nouns.** "the solution of the Lyapunov equation", "a function of $x$", "the derivative of the bound" are the subject, not a verb in disguise.

## 6 Long texts

Length decides structure. The table gives screen thresholds; print doubles them because studied text is read more slowly than scanned text. Say which you used.

| Unit length | Opening | Closing |
|---|---|---|
| ≤ 500 words (screen) / ≤ 1000 (print) | nothing — headings carry it | nothing |
| above that, up to a chapter | preview: 2–4 sentences | nothing |
| a chapter or long section (≤ 3000 words screen / 6000 print) | preview: 3–5 sentences | consolidation block (rule 31) |
| whole document (> ~6000 words) | standalone front matter (rule 33) + preview per unit | consolidation per unit |

29. **Structure follows length, not taste.** Apply the table. Adding a recap to a short note is a violation, not caution.
30. **A long unit opens with a preview, never an announcer.** The preview delivers the conclusion, the order of the argument and why that order, and the decision the reader can make afterwards. Under ~120 words for a chapter. If the conclusion will not fit in the first sentence, the unit has no point yet: find it before writing prose.
31. **A long unit closes by consolidating, not paraphrasing.** At most five items, each one of: a retrieval prompt the reader answers from memory; a consequence statement (what the result forbids, what breaks if the assumption dies); a decision rule for practice. Never a prose restatement of the unit's own sentences.
32. **Pass the skim test.** Title, headings, the first paragraph of each unit and the last consolidation must leave the reader with a correct but incomplete model — never a wrong one. If the skim path misleads, fix the structure: move the conclusion up, rename the heading, or rewrite the preview.
33. **Front matter for decision-makers stands alone.** State the conclusion, the ask, the cost and the risk. Never "this document discusses X", which names a topic instead of a position. Order by importance, not by discovery, so every paragraph survives being the last one read. Where the discipline expects method-first (a paper's IMRaD, a proof's lemma sequence), keep the discipline and put the conclusion in the abstract.

## 7 Overlays

A domain needs more than this file — typeset mathematics, legal, marketing. That law lives in the project holding the problem: for the adaptive-control lecture notes, `writing-rules.md` beside `main.tex`. When a second project needs the same rules, promote them upstream by hand.

## 8 Closing test

Answer from memory. A rule you cannot recall was not worth writing.

1. Which rule fires on: "In this section, we will see why the cache matters."?
2. "We omit the argument from signals, but not their time dependence." Which rule, and what replaces it?
3. You want to repeat a warning for the third time. What must the repeat carry to be legal?
4. "Before adjusting a controller online we ask what we would do with known parameters." Which rule, and what is the fix?
5. The skim path leaves a manager with the wrong conclusion. What is broken — the prose or the structure?
6. "Robust control asks whether the closed loop is stable. There the unknown parameters still matter." Name both rules and both fixes.
7. "The rate of convergence is fixed by the pole of the reference model, and the estimate carries the movement of the model itself." Name the rule and rewrite both halves.
8. "The scope, the risks, the costs, and the timeline all live in this document." Which rule, and what replaces it?
9. "Except as noted in §3, the upgrade runs automatically when the package is signed and the disk has room." Which rule, and what replaces it?

Answers: 1 (rule 1, and the sentence still owes its claim); 2 (rule 25: "We omit the argument from time-dependent signals."); 3 (a new consequence, a decision, or a marker naming where it was established — rules 10, 11); 4 (rule 18: a parameter may be compared only with a parameter); 5 (the structure — rule 32; fix the order, not the adjectives); 6 (rule 34 — a discipline has no mouth, so make the field a location and the engineer the actor; rule 35 — "There" named no container, so name one: "Inside that uncertainty set, the plant parameters still matter, provided the bound holds"); 7 (rule 36 — the pole is the actor and the model moves: "The reference-model pole fixes the rate of convergence, and the estimate also includes how the model itself moves"); 8 (rule 37 — a five-noun train fronts the verb: "This document states the scope. §2 covers risks, §3 costs, §4 timeline."); 9 (rule 39 — main point first, conditions split: "The upgrade runs automatically. It needs a signed package and free disk; §3 lists exceptions").

## 9 Sources

1. Gopen & Swan, *The Science of Scientific Writing*, American Scientist 78(6), 1990 — topic and stress positions (rule 19).
2. Weinberger, Evans & Allesina, *Ten Simple (Empirical) Rules for Writing Science*, PLoS Comp. Biol. 11(4), 2015 — short sentences out-cite long ones (rule 20).
3. Knuth, Cherry & Guibas, *Mathematical Writing*, 1989 — no "clearly/obviously/trivially"; text must carry the argument (rule 22).
4. Halmos, *How to Write Mathematics* — notation economy (rule 17).
5. Dunloski et al., *Improving Students' Learning With Effective Learning Techniques*, PSPI 14(1), 2013 — rereading low utility, retrieval and spacing high (rules 13, 31).
6. Kobak et al., *Delving into ChatGPT usage in academic writing through excess vocabulary*, 2024 — LLM excess vocabulary: *delve* ~25× above trend by 2024, *showcase* and *underscore* ~9×; ≥10% of 2024 PubMed abstracts carried LLM fingerprints (rule 4).
7. Wikipedia, *Signs of AI writing* — rule-of-three padding, "-ing" tails, sectional summaries, negative parallelism, hedged assertions (rules 23, 24).
8. Ausubel, *Educational Psychology: A Cognitive View*, 1968 — the advance organizer (rule 30).
9. Bransford & Johnson, *Contextual prerequisites for understanding*, JVLVB 11(6), 1972 — organizing context before reading raises comprehension of the same text (rule 30).
10. Mayer, *Multimedia Learning*, 2nd ed., 2009 — signaling aids selection and organization; redundancy costs learning (rules 30, 31).
11. Marzano, Pickering & Pollock, *Classroom Instruction That Works*, 2001 — summarization near d≈0.8 when the learner produces it; read against source 5, this settles rule 31 by making the reader produce something.
12. Weinreich et al., *Not Quite the Average*, ACM TOWeb 2(1), 2008, and the Nielsen Norman analyses built on it — reading time grows ~4.4 s per extra 100 words, so conclusions belong at the front (rules 32, 33).
13. Williams, Bizup & Trimble, *Style: Lessons in Clarity and Grace*, 12th ed., 2019 — characters as subjects, actions as main verbs, zombie nouns, twenty-sentence self-check at ~70% (rule 36).
14. Zeiger, *Write Right! Communication Skills for Practicing Engineers*, 2nd ed., 2000 — engineering prose has no licence for ambiguity: repeat the noun (rule 35a).
15. Sainani, *Writing in the Sciences*, Stanford University, 2012– — agent as subject, verbs instead of nominalisations (rule 36).
16. Google, *Developer Documentation Style Guide*, section *Pronouns*; U.S. *Federal Plain Language Guidelines*; KTH writing guide, *Use of pronouns with a clear reference* — a demonstrative takes a noun ("set this value", never "set this"); name the actor; the sentence-relative "which" as the cure for "This is…" (rules 34, 35).
17. U.S. *Federal Plain Language Guidelines* (plainlanguage.gov, GSA), from Garner, *Legal Writing in Plain English* 2001 and the Federal Register *Document Drafting Handbook* — keep the subject, verb, and object close together; write a topic sentence for every paragraph; place the main idea before exceptions and conditions (rules 37, 38, 39).
