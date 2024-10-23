import { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';

function useQuery() {
    return new URLSearchParams(useLocation().search);
}

function SearchPage() {
    const [vaccines, setVaccines] = useState([]);
    const query = useQuery();
    const keyword = query.get('keyword');

    useEffect(() => {
        const fetchVaccines = async () => {
            const response = await fetch(`http://localhost:8080/api/public/vaccines/search?keyword=${keyword}`);
            const data = await response.json();
            setVaccines(data);
        };
        fetchVaccines();
    }, [keyword]);

    return (
        <div>
            <h1>Kết quả tìm kiếm cho "{keyword}"</h1>
            <ul>
                {vaccines.map((vaccine) => (
                    <li key={vaccine.id}>
                        <h2>{vaccine.name}</h2>
                        {/* Hiển thị thông tin vaccine */}
                    </li>
                ))}
            </ul>
        </div>
    );
}
