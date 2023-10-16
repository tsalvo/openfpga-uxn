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
-- Submodules: 78
entity deo_0CLK_e53cbd5e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_e53cbd5e;
architecture arch of deo_0CLK_e53cbd5e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l522_c6_6d39]
signal BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l522_c1_67e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_80a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l522_c2_29a0]
signal n8_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l522_c2_29a0]
signal device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : device_out_result_t;

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l522_c2_29a0]
signal result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(31 downto 0);

-- t8_MUX[uxn_opcodes_h_l522_c2_29a0]
signal t8_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l523_c3_d4da[uxn_opcodes_h_l523_c3_d4da]
signal printf_uxn_opcodes_h_l523_c3_d4da_uxn_opcodes_h_l523_c3_d4da_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l527_c11_749d]
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_a517]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l527_c7_80a4]
signal n8_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l527_c7_80a4]
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : device_out_result_t;

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l527_c7_80a4]
signal result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(31 downto 0);

-- t8_MUX[uxn_opcodes_h_l527_c7_80a4]
signal t8_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l530_c11_0a5e]
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c7_bada]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l530_c7_a517]
signal n8_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l530_c7_a517]
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_return_output : device_out_result_t;

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l530_c7_a517]
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(31 downto 0);

-- t8_MUX[uxn_opcodes_h_l530_c7_a517]
signal t8_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l534_c11_b66c]
signal BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_9169]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l534_c7_bada]
signal n8_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l534_c7_bada]
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_return_output : device_out_result_t;

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l534_c7_bada]
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l537_c11_ccda]
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l542_c1_d9dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l537_c7_9169]
signal n8_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l537_c7_9169]
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_9169]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_9169]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_9169]
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_9169]
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_9169]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l537_c7_9169]
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_9169]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_9169]
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l537_c7_9169]
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l540_c30_0b7c]
signal sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_return_output : signed(3 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l544_c42_49f3]
signal BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l544_c23_e70e]
signal device_out_uxn_opcodes_h_l544_c23_e70e_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e70e_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e70e_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e70e_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e70e_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l544_c23_e70e_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_320a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.device_ram_address := ref_toks_9;
      base.vram_address := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39
BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_left,
BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_right,
BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- n8_MUX_uxn_opcodes_h_l522_c2_29a0
n8_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
n8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
n8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
n8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0
device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0
result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0
result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- t8_MUX_uxn_opcodes_h_l522_c2_29a0
t8_MUX_uxn_opcodes_h_l522_c2_29a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l522_c2_29a0_cond,
t8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue,
t8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse,
t8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

-- printf_uxn_opcodes_h_l523_c3_d4da_uxn_opcodes_h_l523_c3_d4da
printf_uxn_opcodes_h_l523_c3_d4da_uxn_opcodes_h_l523_c3_d4da : entity work.printf_uxn_opcodes_h_l523_c3_d4da_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l523_c3_d4da_uxn_opcodes_h_l523_c3_d4da_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d
BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_left,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_right,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- n8_MUX_uxn_opcodes_h_l527_c7_80a4
n8_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
n8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
n8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
n8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4
device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4
result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4
result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- t8_MUX_uxn_opcodes_h_l527_c7_80a4
t8_MUX_uxn_opcodes_h_l527_c7_80a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l527_c7_80a4_cond,
t8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue,
t8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse,
t8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e
BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_left,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_right,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- n8_MUX_uxn_opcodes_h_l530_c7_a517
n8_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l530_c7_a517_cond,
n8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
n8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
n8_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l530_c7_a517
device_out_result_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_cond,
device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517
result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517
result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- t8_MUX_uxn_opcodes_h_l530_c7_a517
t8_MUX_uxn_opcodes_h_l530_c7_a517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l530_c7_a517_cond,
t8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue,
t8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse,
t8_MUX_uxn_opcodes_h_l530_c7_a517_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c
BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_left,
BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_right,
BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- n8_MUX_uxn_opcodes_h_l534_c7_bada
n8_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l534_c7_bada_cond,
n8_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
n8_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
n8_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l534_c7_bada
device_out_result_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_cond,
device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada
result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada
result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond,
result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda
BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_left,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_right,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_return_output);

-- n8_MUX_uxn_opcodes_h_l537_c7_9169
n8_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l537_c7_9169_cond,
n8_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
n8_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
n8_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l537_c7_9169
device_out_result_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_cond,
device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169
result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_cond,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169
result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output);

-- sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c
sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_ins,
sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_x,
sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_y,
sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3
BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_left,
BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_right,
BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_return_output);

-- device_out_uxn_opcodes_h_l544_c23_e70e
device_out_uxn_opcodes_h_l544_c23_e70e : entity work.device_out_0CLK_b285e9e3 port map (
clk,
device_out_uxn_opcodes_h_l544_c23_e70e_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l544_c23_e70e_device_address,
device_out_uxn_opcodes_h_l544_c23_e70e_value,
device_out_uxn_opcodes_h_l544_c23_e70e_phase,
device_out_uxn_opcodes_h_l544_c23_e70e_previous_device_ram_read,
device_out_uxn_opcodes_h_l544_c23_e70e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 n8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 t8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 n8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 t8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 n8_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 t8_MUX_uxn_opcodes_h_l530_c7_a517_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 n8_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_return_output,
 n8_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output,
 sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_return_output,
 device_out_uxn_opcodes_h_l544_c23_e70e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_20bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l523_c3_d4da_uxn_opcodes_h_l523_c3_d4da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_a5e5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l532_c3_f2b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_eb7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l534_c7_bada_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e70e_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e70e_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e70e_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e70e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e70e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l545_c32_c0e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l546_c31_14cd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l547_c21_6304_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l548_c26_9648_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l549_c29_fead_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l550_c25_05de_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l551_c24_7deb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l522_l530_l527_l534_DUPLICATE_e94d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_2332_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_b396_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_bb49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_ba12_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_39e8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_dc97_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_5f4d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l530_l527_l534_DUPLICATE_74b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_320a_uxn_opcodes_h_l554_l517_DUPLICATE_001f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l532_c3_f2b3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l532_c3_f2b3;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_eb7f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_eb7f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_a5e5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_a5e5;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_20bd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_20bd;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_right := to_unsigned(3, 2);

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
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_ins := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l544_c23_e70e_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l544_c23_e70e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l544_c23_e70e_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l534_c11_b66c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_left;
     BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output := BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l527_c11_749d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_left;
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output := BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l522_l530_l527_l534_DUPLICATE_e94d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l522_l530_l527_l534_DUPLICATE_e94d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_bb49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_bb49_return_output := result.vram_write_layer;

     -- sp_relative_shift[uxn_opcodes_h_l540_c30_0b7c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_ins;
     sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_x;
     sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_return_output := sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l530_c11_0a5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_5f4d LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_5f4d_return_output := result.vram_address;

     -- BIN_OP_MINUS[uxn_opcodes_h_l544_c42_49f3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_left;
     BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_return_output := BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l534_c7_bada_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l522_c6_6d39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_left;
     BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output := BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_2332 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_2332_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_ba12 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_ba12_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l537_c11_ccda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_left;
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output := BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_dc97 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_dc97_return_output := result.device_ram_address;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_39e8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_39e8_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_b396 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_b396_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l530_l527_l534_DUPLICATE_74b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l530_l527_l534_DUPLICATE_74b0_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l522_c6_6d39_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_749d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_0a5e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_b66c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_ccda_return_output;
     VAR_device_out_uxn_opcodes_h_l544_c23_e70e_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l544_c42_49f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_39e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_39e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_39e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_39e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_39e8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_2332_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_2332_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_2332_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_2332_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_2332_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l530_l527_l534_DUPLICATE_74b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l530_l527_l534_DUPLICATE_74b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l530_l527_l534_DUPLICATE_74b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l530_l527_l534_DUPLICATE_74b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l522_l530_l527_l534_DUPLICATE_e94d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l522_l530_l527_l534_DUPLICATE_e94d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l522_l530_l527_l534_DUPLICATE_e94d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l522_l530_l527_l534_DUPLICATE_e94d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_b396_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_b396_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_b396_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_b396_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_b396_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_bb49_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_bb49_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_bb49_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_bb49_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_bb49_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_5f4d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_5f4d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_5f4d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_5f4d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_5f4d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_dc97_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_dc97_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_dc97_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_dc97_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_dc97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_ba12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_ba12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_ba12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_ba12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l537_l527_l522_l534_l530_DUPLICATE_ba12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l540_c30_0b7c_return_output;
     -- t8_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     t8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     t8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_return_output := t8_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- n8_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     n8_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     n8_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_return_output := n8_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l522_c1_67e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_printf_uxn_opcodes_h_l523_c3_d4da_uxn_opcodes_h_l523_c3_d4da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l522_c1_67e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_n8_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     -- t8_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     t8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     t8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := t8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- n8_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     n8_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     n8_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_return_output := n8_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- printf_uxn_opcodes_h_l523_c3_d4da[uxn_opcodes_h_l523_c3_d4da] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l523_c3_d4da_uxn_opcodes_h_l523_c3_d4da_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l523_c3_d4da_uxn_opcodes_h_l523_c3_d4da_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_n8_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- n8_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     n8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     n8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_return_output := n8_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- t8_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     t8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     t8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := t8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;
     -- n8_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     n8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     n8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := n8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l542_c1_d9dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_return_output;

     -- n8_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     n8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     n8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := n8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l544_c23_e70e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c1_d9dc_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;
     -- device_out[uxn_opcodes_h_l544_c23_e70e] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l544_c23_e70e_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l544_c23_e70e_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l544_c23_e70e_device_address <= VAR_device_out_uxn_opcodes_h_l544_c23_e70e_device_address;
     device_out_uxn_opcodes_h_l544_c23_e70e_value <= VAR_device_out_uxn_opcodes_h_l544_c23_e70e_value;
     device_out_uxn_opcodes_h_l544_c23_e70e_phase <= VAR_device_out_uxn_opcodes_h_l544_c23_e70e_phase;
     device_out_uxn_opcodes_h_l544_c23_e70e_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l544_c23_e70e_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output := device_out_uxn_opcodes_h_l544_c23_e70e_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l545_c32_c0e4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l545_c32_c0e4_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l546_c31_14cd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l546_c31_14cd_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l548_c26_9648] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l548_c26_9648_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l551_c24_7deb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l551_c24_7deb_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output.is_deo_done;

     -- device_out_result_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_return_output := device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l550_c25_05de] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l550_c25_05de_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l547_c21_6304] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l547_c21_6304_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l549_c29_fead] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l549_c29_fead_return_output := VAR_device_out_uxn_opcodes_h_l544_c23_e70e_return_output.vram_write_layer;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l551_c24_7deb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l545_c32_c0e4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l548_c26_9648_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l549_c29_fead_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l550_c25_05de_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l546_c31_14cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l547_c21_6304_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output := result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_return_output := device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_return_output := result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_9169] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_9169_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_return_output := device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l534_c7_bada] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_bada_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_a517] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_a517_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l527_c7_80a4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output := result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_80a4_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l522_c2_29a0] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_320a_uxn_opcodes_h_l554_l517_DUPLICATE_001f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_320a_uxn_opcodes_h_l554_l517_DUPLICATE_001f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_320a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l522_c2_29a0_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_320a_uxn_opcodes_h_l554_l517_DUPLICATE_001f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_320a_uxn_opcodes_h_l554_l517_DUPLICATE_001f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
