package gov.ita.dataloader.ingest.translators;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class TranslatorFactory {

  private static final Map<String, Translator> translators = new HashMap<>();

  static {
    translators.put("otexa#ANNUAL.csv", new OtexaAnnualCsvTranslator());
    translators.put("otexa#Merged_Cat_Imports.csv", new OtexaMergedCatImportsCsvTranslator());
    translators.put("otexa#Part_Cat_Imports.csv", new OtexaPartCatImportsCsvTranslator());
    translators.put("otexa#EXPORT_FOOTWEAR_VALUE.csv", new OtexaExportFootwearCsvTranslator("DOLLARS"));
    translators.put("otexa#EXPORT_FOOTWEAR_QTY.csv", new OtexaExportFootwearCsvTranslator("QTY"));
    translators.put("otexa#ANNUAL_FOOTWEAR_VALUE.csv", new OtexaAnnualFootwearCsvTranslator("DOLLARS"));
    translators.put("otexa#ANNUAL_FOOTWEAR_QTY.csv", new OtexaAnnualFootwearCsvTranslator("QTY"));
    translators.put("otexa#EXPORTS_VALUE.csv", new OtexaExportsCsvTranslator("DOLLARS"));
    translators.put("otexa#EXPORTS_QTY.csv", new OtexaExportsCsvTranslator("QTY"));
    translators.put("otexa#Annual_Exports_Historical.csv", new OtexaExportsHistoricalCsvTranslator());
    translators.put("otexa#Trade_Balance.csv", new OtexaTradeBalanceCsvTranslator());
    translators.put("select-usa#WORLDBANK_EASE_COUNTRY_INDEX.csv", new WorldBankEaseIndexCsvTranslator());
    translators.put("sima#census", new SimaCensusCsvTranslator());
  }

  public Translator getTranslator(String containerFileCompositeKey) {
    for (String key : translators.keySet()) {
      if (containerFileCompositeKey.contains(key)) {
        return translators.get(key);
      }
    }

    return null;
  }
}
