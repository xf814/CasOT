<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

  <head>

    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>CasOT - Options</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />

  </head>

  <body>  
    <form name="frm" action="UploadServlet" method="post" enctype="multipart/form-data">


<div class="maintable" width="80%">

<table>

  <a name="general">
  <tr>
    <td colspan="3"><span class="big"><br><b>General options</b></span><br><br></td>
  </tr>

  <tr>
    <th width=10%>Option</th>
    <th width=30%>Values</th>
    <th>Description</th>
  </tr>



  <tr>
    <td><span class="constant">Mode</span></td>
    <td>
      <input type="radio" name="mode" value="single" checked="checked">single-gRNA mode (default)<br>
      <input type="radio" name="mode" value="paired">paired-gRNA mode<br>
      <input type="radio" name="mode" value="target">target-and-off-target mode<br>
    </td>
    <td>
      The searching mode.<br>
      Three modes are available: single-gRNA (<span class="constant">single</span>), paired-gRNA (<span class="constant">paired</span>), and target-and-off-target (<span class="constant">target</span>) mode.<br>
      See <a target="_blank" href="http://eendb.zfgenetics.org/casot/example.php">examples</a>.<br>
    </td>
  </tr>

  <tr>
    <td><span class="constant">Target File</span></td>
    <td>
      <b>Required</b>;a FASTA file.<br>
        <input type="file" name="targetFile" size="40"><br>
      </span>
    </td>
    <td>
      File name of target sites (single- or paired-gRNA mode) or sequence to search for candidate target sites (target-and-off-target mode) in FASTA format.<br>
      In single- or paired-gRNA mode, all sequences should be ended with -NGG (the PAM) and 21-33 nt in length (18-30-nt protospacer plus the PAM). In paired-gRNA mode, same sequence names should be followed with `<span class="constant">_#F</span>' and `<span class="constant">_#R</span>' suffixes in pair. In target-and-off-target mode, input sequences should be &lt;1 kb.<br>
      See <a target="_blank" href="http://eendb.zfgenetics.org/casot/example.php">examples</a>.<br>
    </td>
  </tr>

  <tr>
    <td><span class="constant">Genome File</span></td>
    <td>
      <b>Required.</b><br>
        <select name="genome" size=1>
          <option value="Unselected" selected>Unselected</option>
          <option value="homo_sapiens">Human(Homo sapiens)</option>
          <option value="mus_musculus">Mouse(Mus musculus)</option>
          <option value="danio_rerio">Zebrafish(Danio rerio)</option>
          <option value="caenorhabditis_elegans">C.elegan(Caenorhabditis elegans)</option>
        </select>
    </td>
    <td>
      File names of the genome sequence or other sequences in FASTA format to search for potential off-target sites.<br>
      <a target="_blank" href="http://eendb.zfgenetics.org/casot/download.php#other">Links</a> to download several widely-used genome files are available in the CasOT website. This option can be used more than once for search in multiple genomes.<br>
  </tr>

  <tr>
    <td><span class="constant">Exon File</span></td>
    <td>
      <b>Optional</b>: include a GTF file?<br>
        <input type="radio" name="exon" value="yes">Yes<br>
        <input type="radio" name="exon" value="no" checked="checked">No<br>
    </td>
    <td>
      File name of the exon annotation of certain genome in GTF format.<br>
      <a target="_blank" href="http://eendb.zfgenetics.org/casot/download.php#other">Links</a> to several annotation files are available in the CasOT website. If provided, gene IDs and gene symbols will be output if a potential off-target site is located in an exon. The sequence names in annotation file should be identical to those in genome file, <i>i.e.</i>, `<span class="constant">chr1</span>' is not equal to `<span class="constant">1</span>'.<br>
    </td>
  </tr>

  <tr>
    <td><span class="constant">Output Format</span></td>
    <td>
      <input type="radio" name="output" value="csv"checked="checked"><span class="constant">.csv</span> format (default)<br>
      <input type="radio" name="output" value="tab"><span class="constant">.tab</span> format<br>
    </td>
    <td>
      Output file format.<br>
      The default <span class="constant">.csv</span> (common separated version) file (<span class="constant">csv</span>) can be directly opened by spreadsheet software such as Microsoft Excel. The tabular <span class="constant">.txt</span> file (<span class="constant">tab</span>) is more readable in text editors and can also be copy-pasted to the spreadsheet software.<br>
    </td>
  </tr>


  <a name="ot">
  <tr>
    <td colspan="3"><span class="big"><br><b>Off-target related options for all three modes</b></span><br><br></td>
  </tr>

  <tr>
    <th>Option</th>
    <th>Values</th>
    <th>Description</th>
  </tr>

  <tr>
    <td><span class="constant">Seed Mismatches</span></td>
    <td>
      <select name="seed">
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2" selected>2 (default)</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5 (require large RAM)</option>
        <option value="6">6 (require large RAM)</option>
      </select> mismatch(es)
    </td>
    <td>
      Maximum number of mismatches allowed in the seed region of potential off-target sites.<br>
      If this parameter is &gt; 4 (<span class="constant">-s=5</span> or <span class="constant">-s=6</span>), a large RAM of the computer is needed.<br>
    </td>
  </tr>

  <tr>
    <td><span class="constant">Nonseed Mismatches</span></td>
    <td>
      <span class="constant">0</span>-<span class="constant">255</span> (default: <span class="constant">255</span>).<br>
      <input type="text" name="nonseed" value="255" size="15"> mismatch(es)
    </td>
    <td>
      Maximum allowed number of mismatches in the non-seed region of potential off-target sites.<br>
    </td>
  </tr>

  <tr>
    <td><span class="constant">Pam Type</span></td>
    <td>
      <input type="radio" name="pam" value="A" checked="checked"><span class="constant">A</span>: <span class="constant">-NGG</span> only (default)<br>
      <input type="radio" name="pam" value="B"><span class="constant">B</span>: <span class="constant">-NGG</span> and <span class="constant">-NAG</span><br>
      <input type="radio" name="pam" value="C"><span class="constant">C</span>: <span class="constant">-NGG</span>, <span class="constant">-NAG</span> and <span class="constant">-NNGG</span><br>
      <input type="radio" name="pam" value="N"><span class="constant">N</span>: no limit.<br>
    </td>
    <td>
      Allowed PAM type.
    </td>
  </tr>


  <a name="paired">
  <tr>
    <td colspan="3"><span class="big"><br><b>Option for paired-gRNA mode</b></span><br><br></td>
  </tr>

  <tr>
    <th>Option</th>
    <th>Values</th>
    <th>Description</th>
  </tr>

  <tr>
    <td><span class="constant">Distance</span></td>
    <td>
      <span class="constant">0</span>-<span class="constant">1000</span> (default: <span class="constant">100</span>).<br>
      <input type="text" name="distance" value="100" size="15"> nt(s)
    </td>
    <td>
      Maximum distance (<i>i.e.</i>, number of nucleotides) allowed between the two potential off-target sequences of an input paired-gRNA.<br>
    </td>
  </tr>


  <a name="target">
  <tr>
    <td colspan="3"><span class="big"><br><b>Options for target-and-off-target mode</b></span><br><br></td>
  </tr>

  <tr>
    <th>Option</th>
    <th>Value</th>
    <th>Description</th>
  </tr>

  <tr>
    <td><span class="constant">Require5g</span></td>
    <td>
      <input type="radio" name="require5g" value="yes" checked="checked">required a 5'-G (default)<br>
      <input type="radio" name="require5g" value="no">not required a 5'-G<br>
    </td>
    <td>
      Allowed type of candidate target sites.<br>
      If the value is <span class="constant">no</span>, only a <span class="constant">-NGG</span> PAM is required; if it is <span class="constant">yes</span>, a <span class="constant">G</span> in the first position is required as well (if T7 promoter is used for gRNA transcription, the first nucleotide in the RNA transcript will be guanine).<br>
    </td>
  </tr>

  <tr>
    <td><span class="constant">Length</span></td>
    <td>
      Two numbers between 18 and 30 (default: <span class="constant">19-20</span>).<br>
      <input type="text" name="lengthmin" value="19" size="3"> <span class="constant"><b>-</b></span> <input type="text" name="lengthmax" value="20" size="3"> nts
    </td>
    <td>
      Allowed range (nt) of protospacer length of the candidate sites.<br>
    </td>
  </tr>

</table>


</div>
    <input type="submit" value="Submit" />&nbsp;&nbsp;&nbsp; 
    <input type="reset" value="Reset"/>  
</form>
  </body>  
</html> 