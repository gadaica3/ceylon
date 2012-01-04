package ceylon.language;

import com.redhat.ceylon.compiler.java.metadata.Ceylon;
import com.redhat.ceylon.compiler.java.metadata.Ignore;
import com.redhat.ceylon.compiler.java.metadata.Name;
import com.redhat.ceylon.compiler.java.metadata.Sequenced;
import com.redhat.ceylon.compiler.java.metadata.TypeInfo;

@Ceylon
public interface Category {
    public boolean contains(@Name("element") 
    @TypeInfo("ceylon.language.Equality") java.lang.Object element);
    
    public boolean containsEvery(@Sequenced @Name("elements") 
    @TypeInfo("ceylon.language.Empty|ceylon.language.Sequence<ceylon.language.Equality>")
    Iterable<?> elements);

    public boolean containsAny(@Sequenced @Name("elements") 
    @TypeInfo("ceylon.language.Empty|ceylon.language.Sequence<ceylon.language.Equality>")
    Iterable<?> elements);
    
    @Ignore
    public static final class Category$impl {
        public static boolean containsEvery(Category $this, ceylon.language.Iterable<?> elements) {
            for (ceylon.language.Iterator<?> $element$iter$1 = elements.getIterator(); $element$iter$1 != null; $element$iter$1 = $element$iter$1.getTail()) {
                final java.lang.Object element = $element$iter$1.getHead();
                if (!$this.contains(element)) {
                    return false;
                }
            }
            return true;
        }

        public static boolean containsAny(Category $this, ceylon.language.Iterable<?> elements) {
            for (ceylon.language.Iterator<?> $element$iter$1 = elements.getIterator(); $element$iter$1 != null; $element$iter$1 = $element$iter$1.getTail()) {
                final java.lang.Object element = $element$iter$1.getHead();
                if ($this.contains(element)) {
                    return true;
                }
            }
            return false;
        }
    }
}
