% ============================================================
%  mybeamer.cls
%  Custom Beamer class. Bundles every package import, color,
%  theme tweak, custom environment, and math macro used across
%  my slide decks so that a deck's main .tex file only needs to
%  contain content (and its table-of-contents settings).
% ============================================================

% ------------------------------------------------------------
%  1. Class declaration
% ------------------------------------------------------------
\usepackage{lmodern}
% Pass any class options straight through to beamer.
% https://tex.stackexchange.com/a/418947/116532
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
% Load beamer. notheorems: we define theorem environments ourselves.
% https://tex.stackexchange.com/a/285558/116532
\LoadClass[aspectratio=169,notheorems,10pt]{beamer}

% ------------------------------------------------------------
%  2. Packages
% ------------------------------------------------------------
% Fonts
\usepackage[default]{lato}          % Lato as the main font
% Math
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{mathtools}              % \mathclap, better \underbrace spacing
\usepackage{bm}                     % Bold math
\usepackage{mathrsfs}               % Script math (\mathscr)
\usepackage{dsfont}                 % \mathds (indicator function)
\usepackage{cancel}                 % Cancel out math terms
\usepackage{xfrac}                  % \sfrac slanted fractions
% Tables
\usepackage{booktabs}               % \toprule, \midrule, \bottomrule
\usepackage{multirow}
\usepackage{array}
\usepackage{colortbl}               % Cell background coloring
\usepackage{makecell}
\usepackage[flushleft]{threeparttable}
% Figures & captions
\usepackage{graphicx}
\usepackage{float}                  % Force figure placement with [H]
\usepackage[position=top]{subcaption}
% Lists
\usepackage{enumerate}
\usepackage[shortlabels]{enumitem}
% Bibliography
\usepackage[round]{natbib}
% Miscellaneous
\usepackage{placeins}               % \FloatBarrier
\usepackage[bottom]{footmisc}       % Footnotes at the bottom of the page
\usepackage{listings}               % Syntax-highlighted code
\usepackage{varwidth}
\usepackage{pbox}
\usepackage{comment}                % \begin{comment}...\end{comment}
\usepackage{soul}                   % Highlighting (\hl) and letterspacing
\usepackage{relsize}                % \smaller, \larger
\usepackage{multicol}
\usepackage{lipsum}                 % Placeholder text
\usepackage{fontawesome}            % Icons
\usepackage{appendixnumberbeamer}   % Restart frame numbering in the appendix
% TikZ and its libraries
\usepackage{tikz}
\usetikzlibrary{calc, decorations.pathreplacing, matrix, fit, shapes,
  positioning, chains, arrows, overlay-beamer-styles}
% Hyperlinks (loaded late so it can patch the packages above)
\usepackage{hyperref}

% ------------------------------------------------------------
%  3. Color palette
% ------------------------------------------------------------
\definecolor{gold}{RGB}{249,147,0}
\definecolor{purp}{RGB}{172 59 128}
\definecolor{brightgreen}{RGB}{43 181 85}
\definecolor{repgreen}{RGB}{19 111 99}
\definecolor{themepurple}{RGB}{153 153 217}
\definecolor{indigo}{RGB}{51 51 178}
\definecolor{blue}{RGB}{20 115 251}
\definecolor{myblue}{RGB}{20 115 200}
\definecolor{pink}{RGB}{222 15 112}
\definecolor{repblue}{RGB}{45 59 106}
\definecolor{reporange}{RGB}{255 93 56}
\definecolor{reppurple}{RGB}{172 59 128}
\definecolor{repyellow}{RGB}{255 203 36}
\definecolor{replightgrey}{RGB}{218 222 223}
\definecolor{repmedgrey}{RGB}{143 150 152}
\definecolor{repdarkpurple}{RGB}{107 64 129}
\definecolor{repdarkgrey}{RGB}{75 84 87}
\definecolor{repblack}{RGB}{15 26 30}
\definecolor{repred}{RGB}{237 52 36}
\definecolor{reppink}{RGB}{227 60 102}
\definecolor{plusgreen}{RGB}{48 145 90}
\definecolor{minusred}{RGB}{173 50 63}
\colorlet{gray}{black!25!white}

% Overlay-aware text-color shortcuts, e.g. \red<2>{text}
\newcommand<>{\gray}[1]{\textcolor#2{repmedgrey}{#1}}
\newcommand<>{\grey}[1]{\textcolor#2{repmedgrey}{#1}}
\newcommand<>{\lightgray}[1]{\textcolor#2{replightgrey}{#1}}
\newcommand<>{\white}[1]{\textcolor#2{white}{#1}}
\newcommand<>{\blue}[1]{\textcolor#2{blue!90}{#1}}
\newcommand<>{\black}[1]{\textcolor#2{black!90}{#1}}
\newcommand<>{\myblue}[1]{\textcolor#2{myblue!90}{#1}}
\newcommand<>{\orange}[1]{\textcolor#2{reporange}{#1}}
\newcommand<>{\pink}[1]{\textcolor#2{pink}{#1}}
\newcommand<>{\gold}[1]{\textcolor#2{gold}{#1}}
\newcommand<>{\purp}[1]{\textcolor#2{reppurple}{#1}}
\newcommand<>{\darkpurp}[1]{\textcolor#2{repdarkpurple}{#1}}
\newcommand<>{\green}[1]{\textcolor#2{repgreen}{#1}}
\newcommand<>{\brightgreen}[1]{\textcolor#2{brightgreen}{#1}}
\newcommand<>{\red}[1]{\textcolor#2{repred}{#1}}

% ------------------------------------------------------------
%  4. Theme & general appearance
% ------------------------------------------------------------
\usecolortheme{spruce}
\setbeamercolor{titlelike}{parent=black,bg=myblue!20}
\setbeamercolor{frametitle}{fg=black, bg=myblue!20}
\setbeamercolor{section in toc}{fg=myblue}
\setbeamercolor{subsection in toc}{fg=myblue}
\setbeamercolor{button}{bg=myblue!15,fg=myblue}

% Frame numbers (not navigation controls) in the bottom right
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}[frame number]
% Remove "(cont.)" numbering added by allowframebreaks
\setbeamertemplate{frametitle continuation}{}
% Covered (not-yet-revealed) overlay content is invisible
\setbeamercovered{invisible}
% Slide margins
\setbeamersize{text margin left=6mm,text margin right=6mm}

% ------------------------------------------------------------
%  5. Blocks, lists & theorem-like environments
% ------------------------------------------------------------
% Default block styling
\setbeamercolor{block title}{use=structure,fg=white,bg=structure.fg!75!black}
\setbeamercolor{block body}{parent=normal text,use=block title,bg=block title.bg!10!bg}
\setbeamercolor{block title alerted}{bg=white,fg=black}
\setbeamercolor{block body alerted}{bg=white}
\newcommand{\theoremcite}[1]{{\hypersetup{citecolor=white}\citealt{#1}}}

% List markers
\setbeamertemplate{itemize items}[circle]              % circular bullets
\setbeamertemplate{enumerate subitem}{\alph{enumii})}  % a) b) c) subitems
\setbeamertemplate{enumerate subsubitem}{\roman{enumiii})} % i) ii) subsubitems

% enumitem defaults
\setlist[itemize]{label=$\circ$, leftmargin=2pc, topsep=0.5em, itemsep=0.25em}
\setlist[itemize, 2]{before*=\small}
\setlist[enumerate]{leftmargin=2pc, topsep=0.5em, itemsep=0.25em}
\setlist[enumerate,1]{label = \arabic*.,ref = \arabic*}
\setlist[enumerate,2]{label = \emph{\alph*}),ref = \theenumi.\emph{\alph*}}
\setlist[enumerate,3]{label = \roman*),ref = \theenumii.\roman*}

% Itemize/enumerate variants with extra vertical spacing between items
\newenvironment{wideitemize}{\itemize\addtolength{\itemsep}{\baselineskip}}{\enditemize}
\newenvironment{wideenumerate}{\enumerate\addtolength{\itemsep}{\baselineskip}}{\endenumerate}

% Colored "alert" block with indigo bullets: \bl{Title}{body}
\newcommand{\bl}[2]{{
  \setlist[itemize]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setlist[enumerate]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setbeamercolor{itemize item}{fg=indigo}
  \setbeamercolor{itemize subitem}{fg=indigo}
  \setbeamercolor{itemize subsubitem}{fg=indigo}
  \setbeamercolor{enumerate item}{fg=indigo}
  \setbeamercolor{enumerate subitem}{fg=indigo}
  \setbeamercolor{enumerate subsubitem}{fg=indigo}
  \setbeamercolor{button}{bg=myblue!15,fg=myblue}
  \begin{alertblock}{#1}#2\end{alertblock}
  \setlist[itemize]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
  \setlist[enumerate]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
}}

% Grey example block: \blg{Title}{body}
\setbeamercolor{block title example}{bg=replightgrey!35, fg=black}
\setbeamercolor{block body example}{bg=white, fg=black}
\newcommand{\blg}[2]{{
  \setlist[itemize]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setlist[enumerate]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setbeamercolor{itemize item}{fg=repmedgrey}
  \setbeamercolor{itemize subitem}{fg=repmedgrey}
  \setbeamercolor{itemize subsubitem}{fg=repmedgrey}
  \setbeamercolor{enumerate item}{fg=repmedgrey}
  \setbeamercolor{enumerate subitem}{fg=repmedgrey}
  \setbeamercolor{enumerate subsubitem}{fg=repmedgrey}
  \setbeamercolor{button}{bg=myblue!15,fg=myblue}
  \begin{exampleblock}{#1}#2\end{exampleblock}
  \setlist[itemize]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
  \setlist[enumerate]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
}}

% Blue example block: \blmb{Title}{body}
\newcommand{\blmb}[2]{{
  \setlist[enumerate]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setlist[itemize]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setbeamercolor{block title example}{bg=myblue!10, fg=black}
  \setbeamercolor{block body example}{bg=replightgrey!15, fg=black}
  \setbeamercolor{itemize item}{fg=myblue}
  \setbeamercolor{itemize subitem}{fg=myblue}
  \setbeamercolor{itemize subsubitem}{fg=myblue}
  \setbeamercolor{enumerate item}{fg=myblue}
  \setbeamercolor{enumerate subitem}{fg=myblue}
  \setbeamercolor{enumerate subsubitem}{fg=myblue}
  \setbeamercolor{button}{bg=myblue!15,fg=myblue}
  \begin{exampleblock}{#1}#2\end{exampleblock}
  \setlist[itemize]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
  \setlist[enumerate]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
}}

% Faded blue example block: \blmbfade{Title}{body}
\newcommand{\blmbfade}[2]{{
  \setlist[enumerate]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setlist[itemize]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setbeamercolor{block title example}{bg=myblue!5, fg=black}
  \setbeamercolor{block body example}{bg=replightgrey!10, fg=black}
  \setbeamercolor{itemize item}{fg=myblue}
  \setbeamercolor{itemize subitem}{fg=myblue}
  \setbeamercolor{itemize subsubitem}{fg=myblue}
  \setbeamercolor{enumerate item}{fg=myblue}
  \setbeamercolor{enumerate subitem}{fg=myblue}
  \setbeamercolor{enumerate subsubitem}{fg=myblue}
  \setbeamercolor{button}{bg=myblue!15,fg=myblue}
  \begin{exampleblock}{#1}#2\end{exampleblock}
  \setlist[itemize]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
  \setlist[enumerate]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
}}

% Blue example block on a white body: \blmbw{Title}{body}
\newcommand{\blmbw}[2]{{
  \setlist[enumerate]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setlist[itemize]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setbeamercolor{block title example}{bg=myblue!10, fg=black}
  \setbeamercolor{block body example}{bg=white, fg=black}
  \setbeamercolor{itemize item}{fg=myblue}
  \setbeamercolor{itemize subitem}{fg=myblue}
  \setbeamercolor{itemize subsubitem}{fg=myblue}
  \setbeamercolor{enumerate item}{fg=myblue}
  \setbeamercolor{enumerate subitem}{fg=myblue}
  \setbeamercolor{enumerate subsubitem}{fg=myblue}
  \setbeamercolor{button}{bg=myblue!15,fg=myblue}
  \begin{exampleblock}{#1}#2\end{exampleblock}
  \setlist[itemize]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
  \setlist[enumerate]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
}}

% Pink example block: \blp{Title}{body}
\newcommand{\blp}[2]{{
  \setlist[enumerate]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setlist[itemize]{topsep=0em, label=$\circ$, leftmargin=2pc}
  \setbeamercolor{block title example}{bg=reppurple!10, fg=black}
  \setbeamercolor{block body example}{bg=white, fg=black}
  \setbeamercolor{itemize item}{fg=pink}
  \setbeamercolor{itemize subitem}{fg=pink}
  \setbeamercolor{itemize subsubitem}{fg=pink}
  \setbeamercolor{enumerate item}{fg=pink}
  \setbeamercolor{enumerate subitem}{fg=pink}
  \setbeamercolor{enumerate subsubitem}{fg=pink}
  \setbeamercolor{button}{bg=myblue!15,fg=pink}
  \begin{exampleblock}{#1}#2\end{exampleblock}
  \setlist[itemize]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
  \setlist[enumerate]{topsep=0.25em, label=$\circ$, leftmargin=2pc}
}}

% Compact blue "question" block: \blQ{Title}{body}
\newcommand{\blQ}[2]{{
  \setbeamercolor{block title example}{bg=myblue!10, fg=black}
  \setbeamercolor{block body example}{bg=white!0, fg=black}
  \begin{exampleblock}{#1}#2\end{exampleblock}
}}

% Compact purple "answer" block: \blA{Title}{body}
\newcommand{\blA}[2]{{
  \setbeamercolor{block title example}{bg=purp!15, fg=black}
  \setbeamercolor{block body example}{bg=white!0, fg=black}
  \begin{exampleblock}{#1}#2\end{exampleblock}
}}

% Oval with shaded background 
\usepackage[most]{tcolorbox}
\newtcolorbox{tboxpink}[1][]{
  enhanced,
  breakable,
  colback=pink!5,
  colframe=pink,
  boxrule=1.2pt,
  arc=6pt,
  left=10pt, right=10pt, top=6pt, bottom=6pt,
  #1
}

\newtcolorbox{tboxblue}[1][]{
  enhanced,
  breakable,
  colback=blue!5,
  colframe=blue,
  boxrule=1.2pt,
  arc=6pt,
  left=10pt, right=10pt, top=6pt, bottom=6pt,
  #1
}

% Non-italic theorem-like environments (definition style)
\theoremstyle{plain}
\newtheorem{assumption}{Assumption}
\theoremstyle{definition}
\newtheorem{assump}{Assumption}
\newtheorem{claim}{Claim}
\newtheorem{conj}{Conjecture}
\newtheorem{corollary}{Corollary}
\newtheorem{defn}{Definition}
\newtheorem{example}{Example}
\newtheorem{lemma}{Lemma}
\newtheorem{prop}{Proposition}
\newtheorem{remark}{Remark}
\newtheorem{theorem}{Theorem}

% ------------------------------------------------------------
%  6. Math macros
% ------------------------------------------------------------
% Label a single equation inside an unnumbered align*/gather*:
%   \begin{align*} f(x) &= ax^2 \tageq \label{eq:f} \\ ... \end{align*}
\newcommand*{\tageq}{\refstepcounter{equation}\tag{\theequation}}

% Swap the default \epsilon and \varepsilon glyphs
\let\oldepsilon\epsilon
\let\oldvarepsilon\varepsilon
\renewcommand{\epsilon}{\oldvarepsilon}
\renewcommand{\varepsilon}{\oldepsilon}

% Add space before \forall
\let\oldforall\forall
\renewcommand{\forall}{\ \oldforall}

% Wide versions of accents
\renewcommand{\bar}[1]{\overline{#1}}
\renewcommand{\hat}[1]{\widehat{#1}}
\renewcommand{\tilde}[1]{\widetilde{#1}}

% Auto-sized paired delimiters
\newcommand{\group}[1]{\left. #1 \right.}
\newcommand{\paren}[1]{\left( #1 \right)}
\newcommand{\bracket}[1]{\left[ #1 \right]}
\newcommand{\curly}[1]{\left\{ #1 \right\}}
\newcommand{\inner}[1]{\left\langle #1 \right\rangle}  % Inner product
\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}  % Floor
\newcommand{\ceil}[1]{\left\lceil #1 \right\rceil}     % Ceiling
\newcommand{\abs}[1]{\left| #1 \right|}                % Absolute value
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}     % Norm
\newcommand{\eval}[1]{\left. #1 \right|}               % Evaluated at

% Over/underbrace with (stacked) text labels
\newcommand{\overtexti}[2]{\overbrace{#1}^{\mathclap{\text{#2}}}}
\newcommand{\overtextii}[3]{\overbrace{#1}^{\mathclap{\substack{\text{#2} \\ \text{#3}}}}}
\newcommand{\overtextiii}[4]{\overbrace{#1}^{\mathclap{\substack{\text{#2} \\ \text{#3} \\ \text{#4}}}}}
\newcommand{\undertexti}[2]{\underbrace{#1}_{\mathclap{\text{#2}}}}
\newcommand{\undertextii}[3]{\underbrace{#1}_{\mathclap{\substack{\text{#2} \\ \text{#3}}}}}
\newcommand{\undertextiii}[4]{\underbrace{#1}_{\mathclap{\substack{\text{#2} \\ \text{#3} \\ \text{#4}}}}}

% General math
\newcommand{\oh}{\frac{1}{2}}                          % 1/2
\newcommand{\suchthat}{\text{ s.t. }}                  % Such that
\newcommand{\where}{\middle|}                          % Where (sized bar)
\newcommand{\comp}[1]{#1^{\mathsf{c}}}                 % Complement
\newcommand{\inv}[1]{#1^{-1}}                          % Inverse
\renewcommand{\d}{\ \text{d}}                          % Differential
\newcommand{\corrto}{\rightrightarrows}                % Correspondence
\newcommand{\N}{\mathbb{N}}                            % Natural numbers
\newcommand{\Z}{\mathbb{Z}}                            % Integers
\newcommand{\Q}{\mathbb{Q}}                            % Rational numbers
\newcommand{\R}{\mathbb{R}}                            % Real numbers
\newcommand{\C}{\mathbb{C}}                            % Complex numbers
\renewcommand{\L}{\mathcal{L}}                         % Lagrangian
\newcommand{\sumin}{\sum_{i=1}^n}                      % Sum from 1 to n
\newcommand{\prodin}{\prod_{i=1}^n}                    % Product from 1 to n
\newcommand{\join}{\vee}                               % Join
\newcommand{\bigjoin}{\bigvee}
\newcommand{\meet}{\wedge}                             % Meet
\newcommand{\bigmeet}{\bigwedge}
\DeclareMathOperator*{\argmax}{arg\,max}               % Argmax
\DeclareMathOperator*{\argmin}{arg\,min}               % Argmin
\newcommand{\bmat}[1]{\begin{bmatrix} #1 \end{bmatrix}} % Bracket matrix

% Derivatives
\newcommand{\der}[2]{\frac{\d #1}{\d #2}}              % Derivative
\newcommand{\derol}[2]{\d #1/\d #2}                    % Derivative (one line)
\newcommand{\sder}[2]{\frac{\d^2 #1}{\d #2^2}}         % Second derivative
\newcommand{\pder}[2]{\frac{\partial #1}{\partial #2}} % Partial derivative
\newcommand{\pderol}[2]{\partial #1/\partial #2}       % Partial derivative (one line)
\newcommand{\spder}[2]{\frac{\partial^2 #1}{\partial #2^2}} % Second partial derivative
\newcommand{\mpder}[3]{\frac{\partial^2 #1}{\partial #2 \partial #3}} % Mixed second partial
\newcommand{\npder}[3]{\frac{\partial^{#1} #2}{\partial #3^{#1}}} % nth partial
\newcommand{\nmpder}[4]{\frac{\partial^{#1} #2}{\partial #3 \cdots \partial #4}} % nth mixed partial

% Probability & statistics
\newcommand{\given}{\where}                            % Conditioning bar
\newcommand{\ind}{\mathds{1}}                          % Indicator function
\newcommand{\m}{\mathbf{m}}                            % Lebesgue measure
\renewcommand{\P}{\text{Pr}}                           % Probability
\newcommand{\F}{\mathcal{F}}                           % Filtration
\DeclareMathOperator{\supp}{supp}                      % Support
\renewcommand{\wp}{\text{ w.p. }}                      % With probability
\DeclareMathOperator*{\iid}{iid}                       % iid
\newcommand{\iidsim}{\stackrel{\iid}{\sim}}            % iid over ~
\newcommand{\E}{\mathbb{E}}                            % Expectation
\DeclareMathOperator*{\Var}{Var}                       % Variance
\DeclareMathOperator*{\Cov}{Cov}                       % Covariance
\DeclareMathOperator*{\Avar}{Avar}                     % Asymptotic variance
\DeclareMathOperator*{\Acov}{Acov}                     % Asymptotic covariance
\newcommand{\eqd}{\,{\buildrel \mathcal{D} \over =}\,} % Equal in distribution
\newcommand{\dto}{\,{\buildrel d \over \to}\,}         % Converges in distribution
\newcommand{\pto}{\,{\buildrel p \over \to}\,}         % Converges in probability
\newcommand{\io}{\text{ i.o.}}                         % Infinitely often
\DeclareMathOperator*{\plim}{plim}                     % Probability limit

% Common \mathcal letters
\newcommand{\mcJ}{\mathcal{J}}
\newcommand{\mcI}{\mathcal{I}}
\newcommand{\mcH}{\mathcal{H}}
\newcommand{\mcM}{\mathcal{M}}
\newcommand{\sM}{{\mathcal{M}}}

% Bold vectors
\newcommand{\vvec}{{\mathbf{v}}}
\newcommand{\xvec}{{\mathbf{x}}}
\newcommand{\rvec}{{\mathbf{r}}}
\newcommand{\wvec}{{\mathbf{w}}}
\newcommand{\dvec}{{\mathbf{d}}}
\newcommand{\zvec}{{\mathbf{z}}}
\newcommand{\alphavec}{{\bm{\alpha}}}
\newcommand{\epsvec}{{\bm{\epsilon}}}
\newcommand{\etavec}{{\bm{\eta}}}
\newcommand{\tauvec}{{\bm{\tau}}}
\newcommand{\betavec}{{\bm{\beta}}}
\newcommand{\xivec}{{\bm{\xi}}}
\newcommand{\muvec}{{\bm{\mu}}}
\newcommand{\nuvec}{{\bm{\nu}}}
\newcommand{\pivec}{{\bm{\pi}}}
\newcommand{\sigmavec}{{\bm{\sigma}}}
\newcommand{\rhovec}{{\bm{\rho}}}
\newcommand{\thetavec}{{\bm{\theta}}}
\newcommand{\phivec}{{\bm{\phi}}}
\newcommand{\psivec}{{\bm{\psi}}}
\newcommand{\omegavec}{{\bm{\omega}}}
\newcommand{\zetavec}{{\bm{\zeta}}}
\newcommand{\kappavec}{{\bm{\kappa}}}
\newcommand{\deltavec}{{\bm{\delta}}}
\newcommand{\lambdavec}{{\bm{\lambda}}}
\newcommand{\varphivec}{{\bm{\varphi}}}
\newcommand{\gammavec}{{\bm{\gamma}}}
\newcommand{\lvec}{{\bm{l}}}

% ------------------------------------------------------------
%  7. Figures, tables & notes
% ------------------------------------------------------------
% Caption placement (subfigure labels hidden, captions on top)
\captionsetup[subfigure]{labelformat=empty, aboveskip=-1pt, belowskip=0.5pt}
\captionsetup{position=top}

% Table cell coloring, overlay-aware: \cellhl<2>
\renewcommand<>\cellcolor[1]{{\only#2{\beameroriginal\cellcolor{#1}}}}
\newcommand<>\cellhl{\cellcolor#1{blue!25}}    % blue highlight
\newcommand<>\cellhlg{\cellcolor#1{gray!30}}   % grey highlight

% Figure / table notes
\newcommand{\Picnote}[1]{
  \flushleft
  \hspace{6pt}
  \hangindent=1.75em
  \scriptsize
  \emph{Note:~}~#1
}
\newcommand{\gPicnote}[1]{
  \flushleft
  \hspace{6pt}
  \hangindent=1.75em
  \tiny
  \gray{\emph{Note:~}~#1}
}
\newcommand{\figtext}[1]{%
  \captionsetup{options=figtext}
  \caption*{\hspace{6pt}\hangindent=1.5em #1}
}
\newcommand{\Figtext}[1]{%
  \begin{tablenotes}[para,flushleft]
    \hspace{6pt}
    \hangindent=1.75em
    #1
  \end{tablenotes}
}
\newcommand{\Tabnote}[1]{\vspace{-1em}\Figtext{\scriptsize\emph{Note:~}~#1}}

% Table helpers
\newcommand{\tablinespace}{\addlinespace[.75ex]}
\newcommand{\stdersize}{\scriptsize}
\newcommand{\fignotesize}{\scriptsize}
\newcommand{\estwide}[3]{
  \begin{tabular*}
  {\textwidth}{@{\hskip\tabcolsep\extracolsep\fill}l*{#2}{#3}}
    \toprule
    \input{#1}
  \end{tabular*}
}

% Column-separation length used in multi-column layouts
\newlength\Colsep
\setlength\Colsep{10pt}

% ------------------------------------------------------------
%  8. Spacing, fonts & text helpers
% ------------------------------------------------------------
% Vertical space shortcuts
\newcommand{\myvskip}{\vspace{\baselineskip}}
\newcommand{\myvskipsmall}{\vspace{0.25cm}}
\newcommand{\jump}{\vspace{1em}}
\newcommand{\sjump}{\vspace{0.75em}}
\newcommand{\Hquad}{\hspace{0.5em}}                    % Half a \quad

% Slightly-off-standard font sizes
\newcommand{\notsolarge}[0]{\fontsize{11.5}{11.5}\selectfont}
\newcommand{\notsoscript}[0]{\fontsize{9.5}{9.5}\selectfont}
\newcommand{\notsotiny}[0]{\fontsize{7}{7}\selectfont}

% Footnote with no marker
\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{\noindent #1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

% Warning ornament (\warning)
\newcommand*{\TakeFourierOrnament}[1]{{%
  \fontencoding{U}\fontfamily{futs}\selectfont\char#1}}
\newcommand*{\warning}{\TakeFourierOrnament{66}}

% ------------------------------------------------------------
%  9. Hyperlinks, citations & buttons
% ------------------------------------------------------------
\hypersetup{
  colorlinks=true,
  linkcolor=myblue,   % internal links (sections, equations, ...)
  urlcolor=myblue,    % URLs
  citecolor=black,    % citations
  pdfstartview=Fit,   % open PDF in fit-page mode
}

% Colored citations (grey / blue), leaving other cites black
\newcommand{\gcitep}[1]{\textcolor{repmedgrey}{\hypersetup{citecolor=repmedgrey}\citep{#1}\hypersetup{citecolor=black}}}
\newcommand{\gcitet}[1]{\textcolor{repmedgrey}{\hypersetup{citecolor=repmedgrey}\citet{#1}\hypersetup{citecolor=black}}}
\newcommand{\bcitep}[1]{\textcolor{blue}{\hypersetup{citecolor=blue}\citep{#1}\hypersetup{citecolor=black}}}
\newcommand{\bcitet}[1]{\textcolor{blue}{\hypersetup{citecolor=blue}\citet{#1}\hypersetup{citecolor=black}}}

% Navigation buttons for appendix/back-up slides
\newcommand{\beamerback}[1]{\hspace{0pt plus 1 filll}\hyperlink{#1}{\beamerreturnbutton{Back}}}
\newcommand{\beamerhfillgo}[2]{\hspace{0pt plus 1 filll}\hyperlink{#1}{\beamergotobutton{#2}}}
\newcommand{\beamergo}[2]{\hyperlink{#1}{\beamergotobutton{#2}}}
\newcommand{\beamerbackextra}[1]{\hspace{2pt}\hyperlink{#1}{\beamerreturnbutton{Back}}}
\newcommand{\beamerdetails}[1]{\hspace{3pt}\hyperlink{#1}{\beamergotobutton{Details}}}

% ------------------------------------------------------------
%  10. Compatibility fixes & TikZ overlay styles
% ------------------------------------------------------------
% Allow the subcaption package to work with Beamer
% https://tex.stackexchange.com/a/426090/116532
\makeatletter
\let\@@magyar@captionfix\relax
\makeatother

% Apply a TikZ style only on certain overlays:
%   \node [draw,onslide=<2>{blue}] at (0,0) {Label};
% https://tex.stackexchange.com/a/6155/116532
\tikzset{onslide/.code args={<#1>#2}{%
    \only<#1>{\pgfkeysalso{#2}}
  }
}
