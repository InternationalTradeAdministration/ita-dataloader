package gov.ita.dataloader.ingest.translators;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.io.input.CharSequenceReader;

import java.io.IOException;
import java.io.Reader;
import java.io.StringWriter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class OtexaAnnualFootwearCsvTranslator implements Translator {

  private final String dataType;

  private final ScientificNotationTranslator snt = new ScientificNotationTranslator();

  public OtexaAnnualFootwearCsvTranslator(String dataType) {
    this.dataType = dataType;
  }

  @Override
  public byte[] translate(byte[] bytes) {
    StringWriter stringWriter = new StringWriter();
    CSVPrinter csvPrinter;

    try {
      csvPrinter = new CSVPrinter(stringWriter, CSVFormat.DEFAULT
        .withHeader("Country", "CTRYNUM", "CAT_ID", "HTS", "Units", "DOLLAR_SIGN", "NAICS", "yr", "mon", "HEADER_ID", "VAL", "DATA_TYPE"));

      Reader reader = new CharSequenceReader(new String(bytes));
      CSVParser csvParser;
      csvParser = new CSVParser(
        reader,
        CSVFormat.DEFAULT.withFirstRecordAsHeader().withTrim().withNullString("").withIgnoreHeaderCase());

      Map<String, Integer> headers = csvParser.getHeaderMap();

      List<String> valueFields = headers.keySet().stream()
        .filter(header -> header.startsWith("2"))
        .collect(Collectors.toList());

      for (CSVRecord csvRecord : csvParser.getRecords()) {
        String country = csvRecord.get("Country");
        String ctrynum = csvRecord.get("ctrynum");
        String catId = csvRecord.get("Category");
        String hts = csvRecord.get("HTS");
        String units = csvRecord.get("Units");
        String naics = csvRecord.get("NAICS");
        String dollarSign = "$";
        String yr = csvRecord.get("yr");
        String mon = csvRecord.get("mon");

        for (String header : valueFields) {
          String val = csvRecord.get(header);
          if (val != null) {
            if (snt.isScientificNotation(val)) val = snt.translate(val);
            csvPrinter.printRecord(
              country, ctrynum, catId, hts, units, dollarSign, naics, yr, mon, header, val, this.dataType
            );
          }
        }
      }

      reader.close();
      csvPrinter.flush();

      return csvPrinter.getOut().toString().getBytes();
    } catch (IOException e) {
      e.printStackTrace();
    }

    return null;
  }

  @Override
  public int pageSize() {
    return -1;
  }

  @Override
  public TranslatorType type() {
    return TranslatorType.CSV;
  }
}
