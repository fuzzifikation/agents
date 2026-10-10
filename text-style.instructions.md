---
name: Text Style
description: "Prose law for all text a human reads, AI replies and reasoning included: point before detail, actors as subjects, short subjects with early verbs, kill filler, one name per thing, references that resolve, structure follows length. Not for code."
applyTo: "**/*.md,**/*.tex,**/*.rst,**/*.txt"
---

# Text Style

Good prose leaves a skimming reader correct and never bores a careful one.
The reader should never ask "what is going on" while holding your words in
memory: the point arrives first, the details follow. It applies to anything
a human reads: docs, READMEs, changelogs, design docs, papers, lecture
notes, commit messages, and every AI reply, reasoning included. The
`applyTo` globs below only tell an editor when to attach the file; they do
not bound the law. Code obeys the simplicity laws WP30–WP36 in
`working-principles.instructions.md`. A project may add an overlay that
tightens these rules; it may not loosen them.

Voice: dry, direct, mean about the engineering, never about the reader.

Rules sit under their topic, numbered in reading order. Renumber the whole list whenever it changes, moving every cross-reference in the same edit. Git holds what was and why; the file never carries history.

## 1 Kill criteria

1. **No paraphrase twins.** When two consecutive sentences say the same thing, one dies; the clearer half survives. “In other words”, “This means” and “That is” are flags to run the test, not death sentences: “Run `umixer check --strict`. This means CI fails on the first schema drift.” lives, because the second sentence carries a consequence the first does not spell out. A sentence must add information, consequence, or example; one that adds none, delete.
2. **One rhetorical template per section.** “X alone does not establish Y”, “is not sufficient evidence”, “does not certify”, “not X — Y”, “not only X but also Y”, “it is not about X, it is about Y”: each shape once per section, maximum. Nine identically shaped caveats is a machine fingerprint even when all nine are true.
3. **No filler adjectives.** Banned: crucial, vital, key, powerful, robust (unless a term of art), significant/significantly (unless a statistical claim), seamless, inherent, pivotal, comprehensive, delve, leverage, showcase, underscore, facilitate, utilise, furthermore, moreover, notably, additionally, particularly, testament, landscape. A project's own terms of art are exempt: they name things.
4. **Adverbs become conditions.** Where "often", "typically", "generally" or "usually" hides a testable condition, write the condition: when it holds, and when it does not.
5. **One image per idea, and never explain it.**
6. **Max one colon or dash per sentence.** Judge dash density inside a sentence, not dashes per document. A full stop is not a personality flaw.

## 2 Repetition

Unmarked repetition is a defect: the reader cannot tell emphasis from accident, and the third copy is where reading stops.

7. **State a claim in full once per document**, where it is established. Later appearances are cross-references. Full restatement is legal in three places only: the summary at the top, the user-facing entry point, and the place of application. A warning gets its second full statement where it bites; two per document, maximum.
8. **Deliberate recaps announce themselves** with the project's marker — "(recall §2.4)", "(standing ruling)" — so one grep lists every recap and each can be audited for earning its place.
9. **A recap must demand something.** Rereading is a demonstrably poor way to learn, and a prose recap demands nothing. Write pointer plus question: "The check is the one in §2.4. Which of the two inputs makes it fail, and why?"

## 3 Names

10. **No name before its meaning is available.** First use defines it in the same sentence or points at the definition. Symbols, identifiers, CLI flags, env vars and jargon alike.
11. **One name, one meaning.** Grep the project before introducing a name. If a second meaning wants it, one of them relents.
12. **Same thing, same name.** "The actual regressor" does not become "the signal", then "the input", then "the driving term". Elegant variation is a fault in prose and a correctness bug in code.
13. **Names pay rent.** Do not coin a term, macro, or named constant for something mentioned once.
14. **Compare like with like.** A comparison joins two things of the same type: parameters with parameters, magnitudes with magnitudes, functions with functions. The tell is "uses X rather than doing Y". Fix the type, not the wording. "Before adjusting a controller online we ask what we would do with known parameters" → "Before adjusting a controller's parameters over time, we design a fixed-parameter controller for a known plant". A mixed comparison is a category error and belongs next to unit errors.

## 4 Sentences

15. **Topic first, punch last.** Put the condition where the eye starts and the consequence where the sentence lands. "The build fails, in the case where the flag is unset" → "With the flag unset, the build fails".
16. **Under ~25 words.** Go longer only when the dependency between the clauses is itself the content.
17. **Verbs, not nominalisations.** "We exploit", not "we make use of"; "the error converges", not "the error exhibits convergence". Passive voice only when the actor is genuinely irrelevant, and never "it is seen" without the by whom and the from what.
18. **No hand-waving words, no invisible authorities.** “Clearly”, “obviously”, “trivially”, “simply”, “easily”, “it can be shown”, “one can show”, “it is well known”, “studies show”, “experts argue”, “industry reports”: carry the argument or name the source, or they go. In documentation they mark where the bug is.
19. **No "-ing" tails selling significance.** "…, thereby ensuring consistency", "…, highlighting the need for care": cut, or give the consequence its own sentence.
20. **No padding structures.** Rule-of-three lists where two items serve; a hedging preamble followed by the assertion anyway. Endings belong to §6: short units close with nothing, long units with rule 33’s consolidation.
21. **Main point first, exceptions and qualifications after.** “We often omit $(t)$ from signals, but not their time dependence” → “We often omit $(t)$ from time-dependent signals”. A short condition may lead (rule 15). An exception the reader has not seen the rule for comes after the rule: “Except as described in (b), the review period starts when the submission is complete” → “The review period starts when the submission is complete; paragraph (b) holds an exception.” Several conditions in one sentence: split them into a list, each item one condition. Forbidden: a main clause dragged along by a contradictory tail (“X, but not Y”); chained relatives (“…, which is why …, which is what …”); any point that survives only if the reader keeps the subordinate clause. A hedge that carries information earns its own sentence; one that does not, delete.
22. **Abstractions do not act.** A discipline, theory, method, literature, objective, problem or definition has no mouth: it does not ask, want, argue, claim, wonder, admit, notice, decide or care. "Robust control asks whether the closed loop is stable" → "In robust control the engineer checks whether the closed loop is stable". Convert the field into a location (*in* robust control) or promote its practitioners to the actor. Legal subjects: people (the designer chooses; we assume); devices and signals (the controller saturates; the error converges); mathematical artifacts with logical predicates only (the theorem proves; the bound bounds; the condition rules out; the figure shows).
23. **A reference resolves to one named thing, of the right category.** Every pointing word owes this: `it`, `they`, `this`, `that`, `which`, `there`, `here`, `the latter`.
    (a) Two candidate antecedents: repeat the noun. "The text doesn't change", not "it doesn't change".
    (b) A demonstrative takes a noun ("this bound", "that choice"), never a bare "This is…".
    (c) A locative names its container, and the preposition matches that category: *in* a field, *in* a set, *in* an equation, *in* Case 4, *at* a frequency. "There the unknown parameters still matter" names no container, so the reader picks one.
    (d) After a display, never open with "Here $x$ is…". Name the display ("In \eqref{eq:PE}, $\succeq$ denotes…") or make the thing the subject ("The inequality $e_c^2\le2V_0$ follows from the Lyapunov bound").
    (e) A sentence-level "…, which proves X" is legal only when the preceding clause is the sole possible referent. It is the prescribed cure for a bare "This is…", not a crime.
    (f) Exempt: existential "there is/are" points nowhere, and so does the cleft "it is the error variable *that* has an equilibrium".
    Test before shipping: name the antecedent in three words. If you cannot, the sentence has no content and no synonym will give it one.
24. **Characters as subjects, actions as verbs.** "The designer chose a lower gain", not "a lower gain was chosen" and not "the choice of a lower gain was made". Zombie nouns (*the convergence of*, *the implementation of*) evict the actor and the action at once. Self-check twenty consecutive sentences: at least 70% must take a character as subject and at least 70% an action as main verb. Rule 17 kills the nominalisation; this one hunts the missing actor.
25. **No train as subject.** The verb arrives within about five words of the subject; lists sit after the verb, never in front of it. "The plan, the decisions, the wire contract, the settings reference, and the structure rules all live here" forces the reader to hold five nouns in memory before learning what they do. It passes rules 15 and 24 and still reads like a shipping manifest. Fix: "This file is the whole plan. It covers the wire contract, the settings, and the structure." (Federal Plain Language Guidelines: keep the subject, verb, and object close together.)
26. **Every paragraph opens on the point, never the container.** It states the paragraph’s point; a reader who skims only first sentences gets a correct, incomplete model of the section: rule 34’s skim test at paragraph scale. No document or section opens with “This file is…”, “This document discusses…”, “These notes cover…” Open on the thing itself: “Unified Mixers is one program that owns model traffic on machines you control.” A later line may speak about the document only when it carries a decision: “This file stays current; git holds the history.”

## 5 Process

27. **Reread as the reader, once, before sending.** For every changed paragraph: does the first sentence stand alone (26), does the verb land near the subject (25), can you name each sentence's actor in three words (24)? Reading load is the defect; greps cannot feel it.
28. **Replies are docs.** The law governs AI chat replies and reasoning exactly like files: the first sentence carries the point (rule 26), then the support. No sentence about your own previous message ("the mechanism answer stands as given"); no ledgers written to applause; no telegraph fragments posing as punch ("no theater, just work"). Brevity excuses nothing: an answer that fits in five sentences is five sentences, and those five still obey rules 25 and 26.
29. **Formatting is not content.** Chatbots fake structure with formatting: bold on every instance of a term, "Label: fact" bullets, Title Case headings, heading confetti (skipped levels, one-line sections), "Key takeaways" boxes, emoji. Prose carries conclusions. Use bullets only where items are truly parallel, tables where the reader compares or executes, and sentence case for headings.
30. **No chatbot residue.** Correspondence is not text: “Certainly!”, “Great question”, “I hope this helps”, “let me know if you'd like…” die on sight. Text does not narrate its own making (“I kept your wording”, “based on the provided sources”).

The fingerprint sweep below stays available as a quick machine pass over rules 1–3, 19, 22 and 24 candidates. It lists candidates, never verdicts; reading is the audit.

```sh
grep -rniE 'in other words|this means|it can be shown|it is well known|clearly|obvious|trivial|simply' --include='*.md' --include='*.tex' .
grep -rniE 'delve|showcas|underscor|crucial|vital|notably|additionally|particularly|comprehensive|leverag|facilitat|utiliz|pivotal|seamless|landscape|testament|significantly' --include='*.md' --include='*.tex' .
grep -rniE 'does not establish|not sufficient|not a proof|not certify|does not by itself|alone does not' --include='*.md' --include='*.tex' .
grep -rniE ', (ensuring|highlighting|underscoring|showcasing|demonstrating|indicating|reflecting|enabling|revealing)|not only|in summary|in conclusion|^overall|together, these|it is important' --include='*.md' --include='*.tex' .
grep -rniE '\b(control|theory|field|discipline|method|approach|framework|literature|objective|definition|problem|analysis|design|chapter|section)\s+(asks|wants|argues|claims|believes|knows|worries|cares|insists|admits|prefers|refuses|decides|settles|forgets|remembers|notes|observes)\b' --include='*.md' --include='*.tex' .
grep -rniE '(^|[.;:] )(This|That|These|Those)\s+(is|are|shows|proves|means|follows|fails|gives|makes|leaves|requires|explains|implies)|(^|[.;:] )It\s+(is|does|follows|holds|can|may|gives|needs|makes|costs)|(^|[.;:] )(There|Here)[,\s]' --include='*.md' --include='*.tex' .
grep -rniE '\b(the|this|that|a|an|its|our|their)\s+([a-z]+(tion|sion|ment|ance|ence|ing))\s+of\b' --include='*.md' --include='*.tex' .
```

Windows: `Select-String -Path *.md,*.tex -Pattern '<same pattern>'`. Reading the hits: grep 3 with more than one hit per section breaks rule 2, and any hit on grep 5 breaks rule 22 unless the subject has a mouth. On grep 6, existential "there is/are" is a false positive and a demonstrative already followed by a noun is clean; every other survivor owes you a three-word antecedent.

Three standing false positives:

* **Grep 7 (rule 24) and its evil twin.** "*the convergence of*", "*the implementation of*" name a hidden actor. Never audit rule 24 with an `is/are` + participle grep: in technical prose *is bounded*, *is stable*, *is Hurwitz*, *is positive definite* are predicate adjectives, not hidden actors. One such grep reported 32 violations in a chapter where 24 were "is bounded".
* **Grep 2 and grep 4 keep the load-bearing words.** "additionally" inside a definition ("asymptotic stability additionally requires convergence") states an extra condition; "not only" ("holds from every initial state, not only from nearby ones") excludes a real alternative. Both stay.
* **Math nouns are not zombie nouns.** "the solution of the Lyapunov equation", "a function of $x$", "the derivative of the bound" are the subject, not a verb in disguise.

**Machine tells.** Wikipedia's *Signs of AI writing* and the excess-vocabulary study catalog what betrays machine text. The law already kills most of them; the rest die here, unless a tell earns its place:

* Significance puffery: "stands/serves as a", "is a testament to", "plays a crucial role", "underscores its importance", "reflects broader trends", "marks a turning point", "indelible mark", "evolving landscape". Rule 3 kills the words; the inflated sentences die with them.
* Copula dodging: "serves as", "stands as", "represents", "constitutes" where "is" works; the dodge is the tell.
* Vague attribution: "experts argue", "observers cite", "industry reports", "studies show" with no expert, report or study named. Name it or drop the claim (rule 18's kin).
* Challenges-and-prospects closers: "Despite its success, X faces challenges…", "Future Outlook" sections. This is rule 20's padding at section scale.
* AI-vocabulary clusters: rule 3 words co-occur, one predicts the others; density betrays, a lone word does not (source 6).
* Superficial "-ing" tails: "highlighting", "ensuring", "fostering", "cultivating", "encompassing" (rule 19).
* Negative parallelisms: "not only X but Y", "it is not just X, it's Y", "X rather than Y" where the contrast is decoration (rule 2; rule 14 when the halves are different types).
* Adjective or phrase triples where two items serve (rule 20).
* Dash rhythm: the formulaic "punch — landing" dash. Dense use betrays; presence does not. Rule 6 caps each sentence; the page rhythm is yours to judge.
* Formatting tells: bold-for-emphasis everywhere, bold-label bullets, Title Case headings, heading confetti, emoji (rule 29).
* Chat residue and procedural self-narration: "Certainly!", "I hope this helps", "let me know", "I preserved your wording", "while details are scarce" (rule 30).

**A lone tell proves nothing.** Wikipedia's own false-positive list: perfect grammar, formal or mixed register, blandness, one lone dash, one lone "delve". Tells count in clusters, and 2025 studies put human detection of machine text near chance. Reading stays the audit (rule 27), not tell-policing. Human prose drifts toward machine prose, not the reverse: the drift you defend against is your own.

## 6 Long texts

Length decides structure. The table gives screen thresholds; print doubles them because studied text is read more slowly than scanned text. Say which you used.

| Unit length | Opening | Closing |
|---|---|---|
| ≤ 500 words (screen) / ≤ 1000 (print) | nothing — headings carry it | nothing |
| above that, up to a chapter | preview: 2–4 sentences | nothing |
| a chapter or long section (≤ 3000 words screen / 6000 print) | preview: 3–5 sentences | consolidation block (rule 33) |
| whole document (> ~6000 words) | standalone front matter (rule 35) + preview per unit | consolidation per unit |

31. **Structure follows length, not taste.** Apply the table. Adding a recap to a short note is a violation, not caution.
32. **A long unit opens with a preview, never an announcer.** The preview delivers the conclusion, the order of the argument and why that order, and the decision the reader can make afterwards. Under ~120 words for a chapter. If the conclusion will not fit in the first sentence, the unit has no point yet: find it before writing prose.
33. **A long unit closes by consolidating, not paraphrasing.** At most five items, each one of: a retrieval prompt the reader answers from memory; a consequence statement (what the result forbids, what breaks if the assumption dies); a decision rule for practice. Never a prose restatement of the unit's own sentences.
34. **Pass the skim test.** Title, headings, the first paragraph of each unit and the last consolidation must leave the reader with a correct but incomplete model — never a wrong one. If the skim path misleads, fix the structure: move the conclusion up, rename the heading, or rewrite the preview.
35. **Front matter for decision-makers stands alone.** State the conclusion, the ask, the cost and the risk. Order by importance, not by discovery, so every paragraph survives being the last one read. Where the discipline expects method-first (a paper’s IMRaD, a proof’s lemma sequence), keep the discipline and put the conclusion in the abstract.

## 7 Overlays

A domain needs more than this file — typeset mathematics, legal, marketing. That law lives in the project holding the problem: for the adaptive-control lecture notes, `writing-rules.md` beside `main.tex`. When a second project needs the same rules, promote them upstream by hand.

## 8 Closing test

Answer from memory. A rule you cannot recall was not worth writing.

1. "The bound holds only in the linear regime. In other words, outside it the bound says nothing." Which rule, and what survives?
2. "We omit the argument from signals, but not their time dependence." Which rule, and what replaces it?
3. You want to repeat a warning for the third time. What must the repeat carry to be legal?
4. "Before adjusting a controller online we ask what we would do with known parameters." Which rule, and what is the fix?
5. The skim path leaves a manager with the wrong conclusion. What is broken — the prose or the structure?
6. "Robust control asks whether the closed loop is stable. There the unknown parameters still matter." Name both rules and both fixes.
7. "The rate of convergence is fixed by the pole of the reference model, and the estimate carries the movement of the model itself." Name the rule and rewrite both halves.
8. "The scope, the risks, the costs, and the timeline all live in this document." Which rule, and what replaces it?
9. "Except as noted in §3, the upgrade runs automatically when the package is signed and the disk has room." Which rule, and what replaces it?
10. Your reply is fifteen lines and its answer is one sentence. Which rule, and what is the fix?
11. A README note ends with "**Key takeaways:**" and three bolded bullets. Name two rules and the fix.

Answers: 1 (rule 1 — one half dies; the half that carries the constraint stays: "The bound holds only in the linear regime."); 2 (rule 21: "We omit the argument from time-dependent signals."); 3 (a new consequence, a decision, or a marker naming where it was established — rules 7 and 8); 4 (rule 14: a parameter may be compared only with a parameter); 5 (the structure — rule 34; fix the order, not the adjectives); 6 (rule 22 — a discipline has no mouth, so make the field a location and the engineer the actor; rule 23 — "There" named no container, so name one: "Inside that uncertainty set, the plant parameters still matter, provided the bound holds"); 7 (rule 24 — the pole is the actor and the model moves: "The reference-model pole fixes the rate of convergence, and the estimate also includes how the model itself moves"); 8 (rule 25 — a five-noun train fronts the verb: "This document states the scope. §2 covers risks, §3 costs, §4 timeline."); 9 (rule 21 — main point first, conditions split: "The upgrade runs automatically. It needs a signed package and free disk; §3 lists exceptions"); 10 (rule 28 — the reply opens with the answer and stops when the reader could act; the remaining fourteen lines were texture); 11 (rule 29 — mechanical bold and a takeaways box fake structure; rule 31 — a ≤500-word unit closes with nothing: state the one conclusion in prose or delete it).

## 9 Sources

1. Gopen & Swan, *The Science of Scientific Writing*, American Scientist 78(6), 1990 — topic and stress positions (rule 15).
2. Weinberger, Evans & Allesina, *Ten Simple (Empirical) Rules for Writing Science*, PLoS Comp. Biol. 11(4), 2015 — short sentences out-cite long ones (rule 16).
3. Knuth, Cherry & Guibas, *Mathematical Writing*, 1989 — no "clearly/obviously/trivially"; text must carry the argument (rule 18).
4. Halmos, *How to Write Mathematics* — notation economy (rule 13).
5. Dunloski et al., *Improving Students' Learning With Effective Learning Techniques*, PSPI 14(1), 2013 — rereading low utility, retrieval and spacing high (rules 9, 33).
6. Kobak et al., *Delving into ChatGPT usage in academic writing through excess vocabulary*, 2024 — LLM excess vocabulary: *delve* ~25× above trend by 2024, *showcase* and *underscore* ~9×; ≥10% of 2024 PubMed abstracts carried LLM fingerprints (rule 3).
7. Wikipedia, *Signs of AI writing* (project page, retrieved 2026-10) — the machine-tell catalog: significance puffery (AILEGACY), AI-vocabulary clusters (AIVOCAB), vague attribution (AIWEASEL), challenges-and-prospects closers (FACESCHALLENGES), superficial "-ing" analyses, rule-of-three (RO3), negative parallelisms, bold overuse (AIBOLD), Title Case headings, chat residue (COLLABCOMM), hedging disclaimers (AIDISCLAIMER), em-dash rhythm (AIDASH); plus the ineffective-indicators list and near-chance human detection studies (rules 19, 20, 29, 30).
8. Ausubel, *Educational Psychology: A Cognitive View*, 1968 — the advance organizer (rule 32).
9. Bransford & Johnson, *Contextual prerequisites for understanding*, JVLVB 11(6), 1972 — organizing context before reading raises comprehension of the same text (rule 32).
10. Mayer, *Multimedia Learning*, 2nd ed., 2009 — signaling aids selection and organization; redundancy costs learning (rules 32, 33).
11. Marzano, Pickering & Pollock, *Classroom Instruction That Works*, 2001 — summarization near d≈0.8 when the learner produces it; read against source 5, this settles rule 33 by making the reader produce something.
12. Weinreich et al., *Not Quite the Average*, ACM TOWeb 2(1), 2008, and the Nielsen Norman analyses built on it — reading time grows ~4.4 s per extra 100 words, so conclusions belong at the front (rules 34, 35).
13. Williams, Bizup & Trimble, *Style: Lessons in Clarity and Grace*, 12th ed., 2019 — characters as subjects, actions as main verbs, zombie nouns, twenty-sentence self-check at ~70% (rule 24).
14. Zeiger, *Write Right! Communication Skills for Practicing Engineers*, 2nd ed., 2000 — engineering prose has no licence for ambiguity: repeat the noun (rule 23a).
15. Sainani, *Writing in the Sciences*, Stanford University, 2012– — agent as subject, verbs instead of nominalisations (rule 24).
16. Google, *Developer Documentation Style Guide*, section *Pronouns*; U.S. *Federal Plain Language Guidelines*; KTH writing guide, *Use of pronouns with a clear reference* — a demonstrative takes a noun ("set this value", never "set this"); name the actor; the sentence-relative "which" as the cure for "This is…" (rules 22, 23).
17. U.S. *Federal Plain Language Guidelines* (plainlanguage.gov, GSA), from Garner, *Legal Writing in Plain English* 2001 and the Federal Register *Document Drafting Handbook* — keep the subject, verb, and object close together; write a topic sentence for every paragraph; place the main idea before exceptions and conditions (rules 25, 26 and 21).
