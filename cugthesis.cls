% !TEX TS-program xelatex
% !TEX encoding = UTF-8 Unicode
% -*- coding: UTF-8; -*-
% vim: set fenc=utf-8

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  FileName: cugthesis.cls
%%  Author:   Timozer
%%  E-mail:   zhenyuwang94@gmail.com
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{cugthesis}[2018/03/13 Version 0.1 China University of Geosciences Thesis Template]

\newif\ifcug@doctor\cug@doctorfalse
\newif\ifcug@master\cug@mastertrue
\newif\ifcug@masterprofulltime\cug@masterprofulltimefalse
\newif\ifcug@masterpronofulltime\cug@masterpronofulltimefalse

\DeclareOption{doctor}{\cug@doctortrue\cug@masterfalse\cug@masterprofulltimefalse\cug@masterpronofulltimefalse}
\DeclareOption{master}{\cug@mastertrue\cug@doctorfalse\cug@masterprofulltimefalse\cug@masterpronofulltimefalse}
\DeclareOption{masterprofulltime}{\cug@masterprofulltimetrue\cug@doctorfalse\cug@masterfalse\cug@masterpronofulltimefalse}
\DeclareOption{masterpronofulltime}{\cug@masterpronofulltimetrue\cug@doctorfalse\cug@masterfalse\cug@masterprofulltimefalse}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}} % I don't want you to pass options to the ctexbook class
\ProcessOptions\relax

\LoadClass[ scheme=chinese, heading=true, %nofonts,
    12pt, utf8, a4paper, punct, fancyhdr, twoside, openright,
    amstex]{ctexbook}

%%%%%%%%%%%%%%%%%%%%%%% Load Packages %%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xifthen, xparse, xstring, fancyhdr}

% ams-tex, 用来排出漂亮的公式
\RequirePackage{amstext, amsmath, amssymb, amsfonts}
\RequirePackage{mathrsfs, bm, mathtools}

% 图形支持宏包
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
% 表格控制
\RequirePackage{array, longtable, makecell, tabu, booktabs}

\RequirePackage{enumitem}

%------------------------------------------
\RequirePackage{cugthesisfont}
\RequirePackage{timozerbib}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ctexset{%
    space=auto,
    autoindent=true,
    chapter={%
        afterindent=true,
        pagestyle=plain,
        aftername={\quad},
        format={\centering\bfseries\cug@sanhao},
        beforeskip={2ex},
        afterskip={2ex},
    },
    section={%
        afterindent=true,
        aftername={\quad},
        format={\centering\bfseries\cug@sihao},
        beforeskip={1ex},
        afterskip={1ex},
    },
    subsection={%
        afterindent=true,
        aftername={\quad},
        format={\flushleft\cug@xiaosi},
        beforeskip={1ex},
        afterskip={1ex},
    },
    subsubsection={%
        afterindent=true,
    },
    %paragraph/afterindent=true,
    appendix/numbering = true,
    appendix/name = {附录~}, % {前, 后}
    appendix/number = {\sffamily \Alph{chapter}},
}

\setlist{labelindent=\parindent, leftmargin=*}
%--------------- Page Layout ---------------
\RequirePackage[a4paper, 
    marginparwidth=0pt, marginparsep=0pt,
    top=3cm, bottom=3cm, left=3cm, right=3cm, 
    headheight=2.5cm, headsep=2pt, footskip=2cm]{geometry}
%-------------------------封面制作---------------------------
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

\def\cug@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{%
        \expandafter\gdef\csname cug@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}

\cug@define@term{@titlelogo}
\cug@define@term{@entitlelogo}
%\cug@define@term{title}
\cug@define@term{entitle}
%\cug@define@term{author}
\cug@define@term{enauthor}
\cug@define@term{studentid}
\cug@define@term{major}
\cug@define@term{enmajor}
\cug@define@term{teacher}
\cug@define@term{supervisor}
\cug@define@term{educatingunit}
\ifcug@masterpronofulltime
    \cug@define@term{corporatementor}
\fi
\RequirePackage{zhnumber}
\newcommand{\cugdate}[2]{%
    \zhdigits{#1}年\zhdigits{#2}月
}
%\cug@define@term{date}
\newcommand{\cug@info@table@majorname}{学科专业}
\newcommand{\cug@info@entable@degree}{Master Candidate}
\newcommand{\cug@info@entable@majorname}{Major}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifcug@doctor
    \@titlelogo{中国地质大学\\博士学位论文}
    \renewcommand{\cug@info@entable@degree{Ph.D. Candidate}}
    \@entitlelogo{A Dissertation Submitted to China University of Geosciences \\ For the Doctor Degree of \cug@enmajor} 
\fi
\ifcug@master
    \@titlelogo{中国地质大学\\硕士学位论文}
    \@entitlelogo{A Dissertation Submitted to China University of Geosciences \\ For the Master Degree of \cug@enmajor} 
\fi
\ifcug@masterprofulltime
    \@titlelogo{中国地质大学\\硕士专业学位论文（全日制）}
    \renewcommand{\cug@info@table@majorname}{专业学位类型}
    \renewcommand{\cug@info@entable@majorname}{Professional Degree Type}
    \@entitlelogo{A Dissertation Submitted to China University of Geosciences \\ For the Full-Time Master of Professional Degree of \\ \cug@enmajor} 
\fi
\ifcug@masterpronofulltime
    \@titlelogo{中国地质大学\\硕士专业学位论文（非全日制）}
    \renewcommand{\cug@info@table@majorname}{专业学位类型}
    \renewcommand{\cug@info@entable@majorname}{Professional Degree Type}
    \@entitlelogo{A Dissertation Submitted to China University of Geosciences \\ For the Part-Time Master of Professional Degree of \\ \cug@enmajor} 
\fi

\newcommand{\cug@info@table@item}[2]{
    \makebox[6.5em][s]{#1:} & \makebox[8em][l]{#2} & \\
}
\newcommand{\cug@info@table}{%
    \begin{tabular}{clc}
        \cug@info@table@item{姓名}{\@author}
        \cug@info@table@item{\cug@info@table@majorname}{\cug@major}
        \cug@info@table@item{指导教师}{\cug@teacher}
        \ifcug@masterpronofulltime
            \cug@info@table@item{企业导师}{\cug@corporatementor}
        \fi
        \cug@info@table@item{培养单位}{\cug@educatingunit}
    \end{tabular}
}
\newcommand{\cug@info@entable}{%
    \begin{minipage}{.47\textwidth}
        \begin{flushright}
            \makebox[.46\textwidth][s]{}\\
            \cug@info@entable@degree: \\
            \cug@info@entable@majorname: \\
            Supervisor:
        \end{flushright}
    \end{minipage}
    \begin{minipage}{.47\textwidth}
        \begin{flushleft}
            \makebox[.46\textwidth][s]{}\\
            \cug@enauthor \\
            \cug@enmajor \\
            \cug@supervisor 
        \end{flushleft}
    \end{minipage}
}

%--------------- Title Page ----------------
\renewcommand{\maketitle}{
    \begin{titlepage}
        \thispagestyle{empty}
        \begin{center}\leavevmode
            {\songti \cug@sanhao{学校代码: 10491 \hfill 研究生学号: \cug@studentid }}
            \vspace*{2\baselineskip}
            {\par \Huge \songti \bfseries \cug@@titlelogo \par}
            \vspace*{2.5\baselineskip}
            {\par \huge \heiti \bfseries \@title \par} %
            \vfill
            {\cug@sanhao \songti{\cug@info@table }}
            \vfill
            {\cug@sanhao{\@date}}%
            %\vspace*{\baselineskip}
        \end{center}
        \clearpage
        \thispagestyle{empty}
    \end{titlepage}
}
%\renewcommand\arraystretch{1} % 将行距还原

\newcommand{\makeentitle}{%
    \cleardoublepage 
    \thispagestyle{empty}
    \begin{center}
        \leavevmode
        \vspace*{2\baselineskip}
        {\par \cug@sanhao \cug@@entitlelogo \par}
        \vfill
        {\par \cug@erhao \bfseries \cug@entitle \par}
        \vfill
        {\cug@sanhao \cug@info@entable}
        \vfill
        {\cug@sanhao 
            China University of Geosciences

            Wuhan 430074 P.R. China
        }
        \vspace*{\baselineskip}
    \end{center}
    \clearpage
    \thispagestyle{empty}
}
\newcommand{\makeextrapages}[1]{
    \cug@define@term{@extrapagetype}
    \cug@define@term{@extrapagecontent}
    \cug@define@term{@extrapagesignature}
    \ifnum#1=1
    \@extrapagetype{原创性声明}
    \@extrapagecontent{
        \qquad 本人郑重声明: 本人所呈交的博（硕）士学位论文《\@title》, 是本人在导师的指导下, 
        在中国地质大学（武汉）攻读博（硕）士学位期间独立进行研究工作所取得的成果. 
        论文中除已注明部分外不包含他人已发表或撰写过的研究成果, 
        对论文的完成提供过帮助的有关人员已在文中说明并致以谢意. 
        \\
        \qquad 本人所呈交的博（硕）士学位论文没有违反学术道德和学术规范, 没有侵权行为, 
        并愿意承担由此而产生的法律责任和法律后果. 
    }
    \@extrapagesignature{学位论文作者签名}
    \else 
        \ifnum#1=2
            \@extrapagetype{导师承诺书}
            \@extrapagecontent{
                \qquad 本人郑重承诺: 本人所指导的学位论文《》是在本人的指导下, 
                研究生在中国地质大学（武汉）攻读学位期间独立进行研究工作所取得的成果, 论文由研究生独立完成. 
                \\
                \qquad 研究生所呈交的学位论文没有违反学术道德和学术规范, 没有侵权行为, 
                并愿意承担由此而产生的与导师相关的责任和后果. 
            }
            \@extrapagesignature{指导老师（签字）}
        \else 
            \ifnum#1=3
                \@extrapagetype{使用授权书}
                \@extrapagecontent{
                    \qquad 本人授权中国地质大学（武汉）可采用影印、缩印、数字化或其它复制手段保存本学位论文；
                    学校可向国家有关部门或机构送交本学位论文的电子版全文, 编入有关数据库进行检索、
                    下载及文献传递服务；同意在校园网内提供全文浏览和下载服务. 
                    \\
                    \qquad 涉密论文解密后适用于本授权书. 
                }
                \@extrapagesignature{学位论文作者签名}
            \else
                \ClassError{CUGThesis}{Class Internal Error, In command makeextrapages. I don't know which page to generate.}{}
            \fi
        \fi
    \fi
    \cleardoublepage
    \thispagestyle{empty}
    \renewcommand\arraystretch{1.5} % 将行距还原
    \begin{center}
        \leavevmode 
        \vspace*{\baselineskip}
        {\par \cug@sanhao{中国地质大学（武汉）研究生学位论文\cug@@extrapagetype} \par}
        \vspace*{1.5\baselineskip}
    \end{center}
    {\cug@sihao{
        \cug@@extrapagecontent 
    }}
    \vspace*{1.5\baselineskip}
    \begin{flushright}
        \cug@sihao
        {\cug@@extrapagesignature: \makebox[4em][l]{}}
        \\
        \vspace*{0.5cm}
        {\makebox[3em][s]{日期:} ~\makebox[9em][r]{\qquad 年 \quad 月 \quad 日}}
    \end{flushright}
    \renewcommand\arraystretch{1} % 将行距还原
    \clearpage
    \thispagestyle{empty}
}
\input{./src/authorcv.tex}

\newtoks\cugabstract
\newtoks\cugenabstract
\cug@define@term{keywords}
\cug@define@term{enkeywords}

\newcommand{\makeabstract}{%
    \cleardoublepage 
    \AppChapter{摘\quad 要}{Abstract (in Chinese)}
    \setcounter{page}{1}
    {\cug@xiaosi
    \the\cugabstract \\
    }
    \vspace{1ex}
    \noindent
    {\cug@xiaosi {\bfseries 关键词:}\hskip0.5em \cug@keywords}
    \clearpage 
}
\newcommand{\makeenabstract}{%
    \cleardoublepage 
    \AppChapter{Abstract}{Abstract (in Chinese)}
    {\cug@xiaosi
    \the\cugenabstract \\
    }
    \vspace{1ex}
    \noindent
    {\cug@xiaosi {\bfseries Keywords:}\hskip0.5em \cug@enkeywords}
    \clearpage 
}
%------------------ 目录中的超链接(pdf 文档) ----------------------
\RequirePackage[unicode=true, pdfusetitle,
    bookmarks=true, bookmarksnumbered=false,
    bookmarksopen=false, breaklinks=false,
    pdfborder={0 0 1}, hidelinks=true,
    backref=false, colorlinks=false]{hyperref}

\fancypagestyle{plain}{%
    \fancyhf{} % 清除所有页眉页脚
    \renewcommand{\headrulewidth}{0.4pt}
    \rhead{\thepage}
    \chead{\cug@wuhao 中国地质大学}
}

%------ 重新定义 frontmatter, mainmatter, backmatter
\renewcommand{\frontmatter}{%
    \clearpage
    \pagestyle{plain}
    \pagenumbering{roman}
}
\renewcommand{\mainmatter}{%
    \clearpage
    \setcounter{chapter}{0}
    \pagenumbering{arabic}
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[CO]{\cug@wuhao 中国地质大学}
    \fancyhead[RO, LE]{\cug@wuhao \thepage}
    \fancyhead[CE]{\cug@wuhao \@author: \@title}
    \renewcommand{\headrulewidth}{0.4pt}
    }

\let\cugappendix = \appendix
\renewcommand{\appendix}{
    \setcounter{chapter}{0}
    \cugappendix 
    \@mainmattertrue
}

\newcommand{\AppChapter}[2]{%
    \phantomsection
    \addcontentsline{toc}{chapter}{\bf #1}
    \chapter*{#1}
}

    
\newcommand{\tbib}[1]{%
    \bibliography{#1}
    \addcontentsline{toc}{chapter}{\bf 参考文献}
}

% \RequirePackage{cleveref}
% \cref{label, label, ...}
% \crefrange{}{}
% \cpageref{label, label, ...}
% \cpagerefrange{label}{label}
% maybe i can use cleveref package to solve the problem
\input{./src/utilities.tex}
% \rmfamily, \sffamily, \ttfamily, \upshape, \itshape, \slshape, \scshape, \bfseries, \mdseries, \lfseries
% tex 中定义命令的语句 \def, \gdef, \edef, \xdef, \gdef -> \global\def
% \def<命令模板>{定义}
% \def\Emph#1{\bf{#1}}
% 排版文件目录树的宏包: dirtree, forest
%--------------- Source Code ---------------
\endinput 
