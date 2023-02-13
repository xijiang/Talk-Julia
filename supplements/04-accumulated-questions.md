{
 "cells": [
  {
   "attachments": {},
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## Why these whys?\n",
    "Julia has a few coding styles that is less common in other luanguages, e.g., C or Fortran. Below is a collection of them."
   ]
  },
  {
   "attachments": {},
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## Short-circuiting\n",
    "Short circuit is common in many languages. That is, when a combined locgical expression is evaluated, the evaluation stops when the result is determined. For example, in the expression `a && b`, if `a` is `false`, then `b` is not evaluated.\n",
    "\n",
    "You can then write very concise code, e.g.,\n",
    "\n",
    "```julia\n",
    "a = 1\n",
    "a < 0 && println(\"a = $a is less than 0\")\n",
    "# or\n",
    "a >=0 || println(\"a = $a is less than 0\")\n",
    "```\n",
    "\n",
    "Normally you might need to write 3 lines or more to do the same thing.\n",
    "\n",
    "```julia\n",
    "a = 0\n",
    "if a < 0\n",
    "    println(\"a = $a is less than 0\")\n",
    "end\n",
    "# or\n",
    "if a >= 0\n",
    "    # do nothing\n",
    "else\n",
    "    println(\"a = $a is less than 0\")\n",
    "end\n",
    "```"
   ]
  },
  {
   "attachments": {},
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## Anonymous functions\n",
    "Anonymous functions are functions without names. They are very useful when you want to pass a function as an argument to another function. For example, you can pass an anonymous function to `map` to apply it to each element of an array.\n",
    "\n",
    "```julia\n",
    "map(x -> x^2, [1, 2, 3])\n",
    "```"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Julia 1.8.5",
   "language": "julia",
   "name": "julia-1.8"
  },
  "language_info": {
   "file_extension": ".jl",
   "mimetype": "application/julia",
   "name": "julia",
   "version": "1.8.5"
  },
  "orig_nbformat": 4
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
