<?php
require_once __DIR__.'/prestacore/bootstrap.php';

$template = new HTMLTemplateInvoice($exampleOrder, $smarty);

$pdf = new PDFGenerator();
$pdf->setFontForLang('en');
$pdf->startPageGroup();
$pdf->createHeader($template->getHeader());
$pdf->createContent($template->getContent());
$pdf->createFooter($template->getFooter());
$pdf->writePage();

$pdf->output('preview.pdf', 'I');

