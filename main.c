#include <stdio.h>
#include <string.h>

extern size_t	ft_strlen(const char *str);
extern char		*ft_strcpy(char *dest, const char *src);
extern int		ft_strcmp(const char *s1, const char *s2);

int main() {
	const char	*src = "Hello, world!";
	size_t		len;

	//ft_strlen
	len = ft_strlen(src);
	printf("#####-----Testing ft_strlen-----#####\n");
	printf("src contain's: >%s<\n", src);
	printf("Length of src is: %zu.\n", len);
	printf("Original strlen thinks it's %zu long.\n\n", strlen(src));
	
	char		dest[len];
	char		*check = NULL;
	
	//ft_strcpy
	printf("#####-----Testing ft_strcpy-----#####\n");
	printf("src is:>%s<, dest is: >%s<, check is: >%s<\ncopy it...\n", src, dest, check);
	check = ft_strcpy(dest, src);
	printf("src is:>%s<, dest is: >%s<, check is: >%s<\n\n", src, dest, check);
	
	//ft_strcmp
	int		diff = 0;
	char	*test;

	diff = ft_strcmp(src, dest);
	printf("#####-----Testing ft_strcmp-----#####\n");
	printf("diff between src:>%s< and dest: >%s< is %d\t\t|strcmp say's %d\n", src, dest, diff, strcmp(src, dest));
	test = "i'm different";
	diff = ft_strcmp(src, test);
	printf("diff between src:>%s< and test: >%s< is %d\t|strcmp say's %d\n", src, test, diff, strcmp(src, test));
	diff = ft_strcmp(test, src);
	printf("diff between test:>%s< and src: >%s< is %d\t|strcmp say's %d\n", test, src, diff, strcmp(test, src));
	return (0);
}
