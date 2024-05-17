version 1.0
workflow CountPatterns {
  input {
    File FASTA_file
    }
  call CountMotif {
    input:
      FASTA_input = FASTA_file
  }
  output {
    File counts = CountMotif.final_count
  }
}
task CountMotif {
  input {
    File FASTA_input
  }
  command <<<
    python3 /count_patterns.py -i ~{FASTA_input} > counts.txt
  >>>
  output {
    File final_count = "counts.txt"
  }
  runtime {
    docker: "ltarhan/fastacountspython"
  }
}
    
