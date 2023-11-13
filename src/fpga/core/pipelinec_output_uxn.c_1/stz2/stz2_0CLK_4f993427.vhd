-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 68
entity stz2_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_4f993427;
architecture arch of stz2_0CLK_4f993427 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1483_c6_b75f]
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1483_c1_6eaa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1483_c2_5bd7]
signal t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c2_5bd7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1483_c2_5bd7]
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c2_5bd7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c2_5bd7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c2_5bd7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c2_5bd7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1483_c2_5bd7]
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1483_c2_5bd7]
signal n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1484_c3_eff0[uxn_opcodes_h_l1484_c3_eff0]
signal printf_uxn_opcodes_h_l1484_c3_eff0_uxn_opcodes_h_l1484_c3_eff0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_7abb]
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1488_c7_48ef]
signal t8_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_48ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1488_c7_48ef]
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_48ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_48ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1488_c7_48ef]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_48ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1488_c7_48ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1488_c7_48ef]
signal n16_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_0046]
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1491_c7_4576]
signal t8_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_4576]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_4576]
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_4576]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1491_c7_4576]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_4576]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_4576]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_4576]
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1491_c7_4576]
signal n16_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_3e1a]
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_6b55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_6b55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_6b55]
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1495_c7_6b55]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_6b55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_6b55]
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1495_c7_6b55]
signal n16_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1497_c3_7899]
signal CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_c1fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_5e54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_5e54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_5e54]
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_5e54]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c7_5e54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_5e54]
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1499_c7_5e54]
signal n16_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1500_c3_9824]
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1502_c30_d781]
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1505_c31_d6c1]
signal CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_1d79]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_22bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_22bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_22bd]
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_22bd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_22bd]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1509_c33_6963]
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_3705]
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_ceb2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_ceb2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_69e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_left,
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_right,
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_return_output);

-- t8_MUX_uxn_opcodes_h_l1483_c2_5bd7
t8_MUX_uxn_opcodes_h_l1483_c2_5bd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond,
t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue,
t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse,
t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

-- n16_MUX_uxn_opcodes_h_l1483_c2_5bd7
n16_MUX_uxn_opcodes_h_l1483_c2_5bd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond,
n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue,
n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse,
n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

-- printf_uxn_opcodes_h_l1484_c3_eff0_uxn_opcodes_h_l1484_c3_eff0
printf_uxn_opcodes_h_l1484_c3_eff0_uxn_opcodes_h_l1484_c3_eff0 : entity work.printf_uxn_opcodes_h_l1484_c3_eff0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1484_c3_eff0_uxn_opcodes_h_l1484_c3_eff0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_left,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_right,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output);

-- t8_MUX_uxn_opcodes_h_l1488_c7_48ef
t8_MUX_uxn_opcodes_h_l1488_c7_48ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1488_c7_48ef_cond,
t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue,
t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse,
t8_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output);

-- n16_MUX_uxn_opcodes_h_l1488_c7_48ef
n16_MUX_uxn_opcodes_h_l1488_c7_48ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1488_c7_48ef_cond,
n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue,
n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse,
n16_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_left,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_right,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output);

-- t8_MUX_uxn_opcodes_h_l1491_c7_4576
t8_MUX_uxn_opcodes_h_l1491_c7_4576 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1491_c7_4576_cond,
t8_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue,
t8_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse,
t8_MUX_uxn_opcodes_h_l1491_c7_4576_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output);

-- n16_MUX_uxn_opcodes_h_l1491_c7_4576
n16_MUX_uxn_opcodes_h_l1491_c7_4576 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1491_c7_4576_cond,
n16_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue,
n16_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse,
n16_MUX_uxn_opcodes_h_l1491_c7_4576_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_left,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_right,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output);

-- n16_MUX_uxn_opcodes_h_l1495_c7_6b55
n16_MUX_uxn_opcodes_h_l1495_c7_6b55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1495_c7_6b55_cond,
n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue,
n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse,
n16_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1497_c3_7899
CONST_SL_8_uxn_opcodes_h_l1497_c3_7899 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_x,
CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output);

-- n16_MUX_uxn_opcodes_h_l1499_c7_5e54
n16_MUX_uxn_opcodes_h_l1499_c7_5e54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1499_c7_5e54_cond,
n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue,
n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse,
n16_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824
BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_left,
BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_right,
BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1502_c30_d781
sp_relative_shift_uxn_opcodes_h_l1502_c30_d781 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_ins,
sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_x,
sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_y,
sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1
CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_x,
CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_left,
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_right,
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_left,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_right,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_return_output,
 t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
 n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output,
 t8_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output,
 n16_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output,
 t8_MUX_uxn_opcodes_h_l1491_c7_4576_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output,
 n16_MUX_uxn_opcodes_h_l1491_c7_4576_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output,
 n16_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output,
 CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output,
 n16_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_return_output,
 sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_return_output,
 CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_ba97 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1484_c3_eff0_uxn_opcodes_h_l1484_c3_eff0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_cb1f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_88d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_4576_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_4f4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_c713_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_a450_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_0b8a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_2dfc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_b9fb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_4265_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_4440_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_4d15_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_3f83_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_1e4f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1517_l1477_DUPLICATE_ffe0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_cb1f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_cb1f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_88d7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_88d7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_ba97 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_ba97;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_y := resize(to_signed(-3, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_2dfc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_2dfc_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_7abb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_c1fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_4440 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_4440_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_3f83 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_3f83_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_4265 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_4265_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1504_c22_4f4e] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_4f4e_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- sp_relative_shift[uxn_opcodes_h_l1502_c30_d781] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_ins;
     sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_x;
     sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_return_output := sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_3705] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_left;
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_return_output := BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_1d79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1510_c21_0b8a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_0b8a_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_1e4f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_1e4f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_3e1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1483_c6_b75f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_0046] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_left;
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output := BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_4d15 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_4d15_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_b9fb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_b9fb_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_4576_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1509_c33_6963] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_b75f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7abb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_0046_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_3e1a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_c1fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_1d79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_3705_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_4f4e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_1e4f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_1e4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_0b8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_4440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_4440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_4440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_4440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_4440_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_b9fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_b9fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_b9fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_b9fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_b9fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_3f83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_3f83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_3f83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_3f83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_3f83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_3f83_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_4265_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_4265_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_4265_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_4265_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_4265_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_4265_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_2dfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_2dfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_2dfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_2dfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_2dfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_4d15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_4d15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_4d15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_4d15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_4d15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_4576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_d781_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1509_c22_a450] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_a450_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_6963_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_22bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1483_c1_6eaa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1491_c7_4576_cond <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_cond;
     t8_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue;
     t8_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_return_output := t8_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_22bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_ceb2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1500_c3_9824] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_left;
     BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_return_output := BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_ceb2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1497_c3_7899] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_return_output := CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c7_5e54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_9824_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_a450_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_7899_return_output;
     VAR_printf_uxn_opcodes_h_l1484_c3_eff0_uxn_opcodes_h_l1484_c3_eff0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_6eaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_ceb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_22bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1499_c7_5e54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1499_c7_5e54_cond <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_cond;
     n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue;
     n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output := n16_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;

     -- printf_uxn_opcodes_h_l1484_c3_eff0[uxn_opcodes_h_l1484_c3_eff0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1484_c3_eff0_uxn_opcodes_h_l1484_c3_eff0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1484_c3_eff0_uxn_opcodes_h_l1484_c3_eff0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1488_c7_48ef] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1488_c7_48ef_cond <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_cond;
     t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue;
     t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output := t8_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1505_c31_d6c1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_return_output := CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_48ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_5e54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_22bd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_6b55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_22bd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_22bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;
     -- t8_MUX[uxn_opcodes_h_l1483_c2_5bd7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond;
     t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue;
     t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output := t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_5e54] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1505_c21_c713] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_c713_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_d6c1_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_5e54] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output := result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;

     -- n16_MUX[uxn_opcodes_h_l1495_c7_6b55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1495_c7_6b55_cond <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_cond;
     n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue;
     n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output := n16_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_5e54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_6b55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c2_5bd7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_c713_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;
     -- n16_MUX[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1491_c7_4576_cond <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_cond;
     n16_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue;
     n16_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_return_output := n16_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_6b55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_48ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_6b55] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output := result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1495_c7_6b55] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_5e54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output := result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5e54_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_48ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output := result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c2_5bd7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1488_c7_48ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1488_c7_48ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_cond;
     n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue;
     n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output := n16_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_6b55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_6b55_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_48ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1488_c7_48ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c2_5bd7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_4576] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output := result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;

     -- n16_MUX[uxn_opcodes_h_l1483_c2_5bd7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond;
     n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue;
     n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output := n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1488_c7_48ef] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4576_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c2_5bd7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c2_5bd7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1488_c7_48ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1483_c2_5bd7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_48ef_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1483_c2_5bd7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1517_l1477_DUPLICATE_ffe0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1517_l1477_DUPLICATE_ffe0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_69e5(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_5bd7_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1517_l1477_DUPLICATE_ffe0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1517_l1477_DUPLICATE_ffe0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
