import com.intuit.karate.junit5.Karate;

public class FeatureRunner {

    @Karate.Test
    Karate metaWeatherTest(){
        return new Karate().tags("@meta_weather").relativeTo(getClass());
    }

    @Karate.Test
    Karate bookIt(){
        return new Karate().tags("@bookit").relativeTo(getClass());
    }
}
