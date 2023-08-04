\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{response}[2023/08/04 Paper comment-by-comment responses]
\LoadClass[12pt,a4paper]{article}
\RequirePackage{xr}
\RequirePackage{color}
\RequirePackage{titlesec}
\RequirePackage{amsmath,amssymb,amsthm,bm,fixdif}
\RequirePackage{setspace}
\onehalfspacing
\RequirePackage{geometry}
\geometry{top=3cm,bottom=3cm,left=2.5cm,right=2.5cm}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\fancypagestyle{plain}{%
    \fancyhf{} % 清空所有预设样式
    \fancyfoot[C]{\thepage{}/\pageref*{LastPage}} % 设置页脚中心位置
    \renewcommand{\headrulewidth}{0pt} % 页眉横线的宽度
    \renewcommand{\footrulewidth}{0pt}   % 页脚横线的宽度
}
\pagestyle{plain}

\RequirePackage{hyperref}
\RequirePackage[noabbrev]{cleveref}
\def\mycolor{red}
\hypersetup{colorlinks=true,linkcolor=\mycolor,citecolor=\mycolor,urlcolor=\mycolor}
\RequirePackage[style=apa, backend=biber, natbib=true]{biblatex}
\newcounter{comment}[section]
\setcounter{comment}{0}
\renewcommand{\thecomment}{Comment\,\,\arabic{comment}}

\newenvironment{comment}
   {\refstepcounter{comment} \bigskip \noindent {\textbf{\thecomment} } ---\ }
   {\par }

\newenvironment{response}
   {\medskip \noindent \color{blue} \textbf{Response}:\  }
   {\medskip \par}

\makeatletter
\newcommand*{\addFileDependency}[1]{% argument=file name and extension
  \typeout{(#1)}
  \@addtofilelist{#1}
  \IfFileExists{#1}{}{\typeout{No file #1.}}
}
\makeatother

\newcommand*{\myexternaldocument}[1]{%
    \externaldocument{#1}%
    \addFileDependency{#1.tex}%
    \addFileDependency{#1.aux}%
}

% \myexternaldocument{main}
%\externaldocument[I-]{main}

\titleformat{\section}{\Large\bfseries}{}{0em}{}